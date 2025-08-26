import 'dart:io';
import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/features/Home/presentation/bloc/cubit/ai_camera_cubit.dart';
//import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

class Camera extends StatelessWidget {
  static const routeName = 'camera/';

  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(alignment: Alignment.center, children: [
        CameraAwesomeBuilder.awesome(
          onMediaCaptureEvent: (event) {
            switch ((event.status, event.isPicture, event.isVideo)) {
              case (MediaCaptureStatus.capturing, true, false):
                debugPrint('Capturing picture...');
              case (MediaCaptureStatus.success, true, false):
                event.captureRequest.when(
                  single: (single) {
                    debugPrint('Picture saved: ${single.file?.path}');
                    final file = File(single.file!.path);
                    context.read<AiCameraCubit>().uploadAiImage(file);
                  },
                  multiple: (multiple) {
                    multiple.fileBySensor.forEach((key, value) {
                      debugPrint('multiple image taken: $key ${value?.path}');
                    });
                  },
                );
              case (MediaCaptureStatus.failure, true, false):
                debugPrint('Failed to capture picture: ${event.exception}');
              case (MediaCaptureStatus.capturing, false, true):
                debugPrint('Capturing video...');
              case (MediaCaptureStatus.success, false, true):
                event.captureRequest.when(
                  single: (single) {
                    debugPrint('Video saved: ${single.file?.path}');
                  },
                  multiple: (multiple) {
                    multiple.fileBySensor.forEach((key, value) {
                      debugPrint('multiple video taken: $key ${value?.path}');
                    });
                  },
                );
              case (MediaCaptureStatus.failure, false, true):
                debugPrint('Failed to capture video: ${event.exception}');
              default:
                debugPrint('Unknown event: $event');
            }
          },
          saveConfig: SaveConfig.photo(
            pathBuilder: (sensors) async {
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory(
                '${extDir.path}/camerawesome',
              ).create(recursive: true);
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                return SingleCaptureRequest(filePath, sensors.first);
              }
              // Separate pictures taken with front and back camera
              return MultipleCaptureRequest(
                {
                  for (final sensor in sensors)
                    sensor:
                        '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                },
              );
            },
            exifPreferences: ExifPreferences(saveGPSLocation: true),
          ),
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_4_3,
            zoom: 0.0,
          ),
          enablePhysicalButton: true, // filter: AwesomeFilter.AddictiveRed,
          previewAlignment: Alignment.center,
          topActionsBuilder: (state) {
            return const SizedBox.shrink();
          },
          theme: AwesomeTheme(
              bottomActionsBackgroundColor: ColorManger.primary,
              buttonTheme: AwesomeButtonTheme(
                buttonBuilder: (child, onTap) {
                  return InkWell(
                    onTap: onTap,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: ColorManger.primary,
                        shape: BoxShape.circle,
                      ),
                      child: child,
                    ),
                  );
                },
              )),
          previewFit: CameraPreviewFit.contain,
          onMediaTap: (mediaCapture) {
            mediaCapture.captureRequest.when(
              single: (single) {
                debugPrint('single: ${single.file?.path}');
                // single.file?.open();
              },
              multiple: (multiple) {
                multiple.fileBySensor.forEach((key, value) {
                  debugPrint('multiple file taken: $key ${value?.path}');
                  // value?.open();
                });
              },
            );
          },
          availableFilters: awesomePresetFiltersList,
        ),
        Image.asset(ImagesConstantsAsset.camera),
        BlocListener<AiCameraCubit, AiCameraState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () => context.loadingDialog,
              error: (message) {
                context.pop();
                context.errorDialog(message);
              },
              loaded: (data) {
                context.pop();
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  isScrollControlled: true,
                  builder: (context) => _AiResponseBottomSheet(data: data),
                );
              },
            );
          },
          child: const SizedBox.shrink(),
        ),
      ]),
    );
  }
}

Future<String> path(CaptureMode captureMode) async {
  final Directory extDir = await getTemporaryDirectory();
  final testDir =
      await Directory('${extDir.path}/test').create(recursive: true);
  final String fileExtension = captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
  final String filePath =
      '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
  return filePath;
}

class _AiResponseBottomSheet extends StatelessWidget {
  final Map<String, dynamic> data;

  const _AiResponseBottomSheet({required this.data});

  @override
  Widget build(BuildContext context) {
    final texts = data.entries
        .where((entry) => entry.key != 'message')
        .toList(); // exclude the message

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextManger(
            'ImageProcessingSuccess',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ...texts.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: (entry.value as List)
                      .map<Widget>((text) => Chip(label: Text(text.toString())))
                      .toList(),
                ),
                const Divider(),
              ],
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
