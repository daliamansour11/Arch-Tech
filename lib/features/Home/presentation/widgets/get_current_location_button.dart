import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/features/Home/presentation/bloc/google_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCurrentLocationButton extends StatelessWidget {
  const GetCurrentLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: context.height * 0.21,
      end: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () {
            context
                .read<GoogleMapBloc>()
                .add(const GoogleMapEvent.getCurrentLocation());
          },
          child: const Icon(Icons.my_location, color: ColorManger.primary),
        ),
      ),
    );
  }
}
