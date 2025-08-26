import 'dart:async';

import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnection extends StatefulWidget {
  static const String route = 'InternetConnection/';
  final InternetConnectionChecker internetConnectionChecker;

  const InternetConnection({
    super.key,
    required this.internetConnectionChecker,
  });

  @override
  State<InternetConnection> createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {
  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void initState() {
    super.initState();

    listener = widget.internetConnectionChecker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _pop();
          break;
        case InternetConnectionStatus.disconnected:
          break;
        case InternetConnectionStatus.slow:
          break;
      }
    });
  }

  @override
  void dispose() {
    listener.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi,
                size: 150,
                color: ColorManger.primary,
              ),
              const SizedBox(height: 24),
              const TextManger(
                'No Internet Connection',
                style: TextStyleManager.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const TextManger(
                'Please check your connection and try again.',
                style: TextStyleManager.bodyMediumGrey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _retryConnection,
                icon: const Icon(Icons.refresh),
                label: const TextManger('Retry'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _retryConnection() {
    widget.internetConnectionChecker.hasConnection.then((isConnected) {
      if (isConnected) {
        _pop();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  TextManger('Still no internet connection. Please try again.'),
            ),
          );
        }
      }
    });
  }

  void _pop() {
    Navigator.of(context).pop(true);
  }
}
