import 'package:archtech/core/_notification.dart/cubit/notification_cubit_cubit.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = 'notificationPage/';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextManger(
          'Notifications',
          style: TextStyleManager.headlineLarge,
        ),
      ),
      body: BlocBuilder<NotificationCubitCubit, NotificationCubitState>(
        builder: (context, state) {
          if (state.notifications.isEmpty) {
            return const Center(
              child: TextManger('NoNotifications',
                  style: TextStyleManager.headlineLarge),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return NotificationCard(
                message: notification,
              );
            },
            itemCount: state.notifications.length,
          );
        },
      ),
    );
  }
}
