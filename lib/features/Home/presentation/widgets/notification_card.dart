import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/extension/format_date_time_on_date_time.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/widgets/user_circlemage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final RemoteMessage message;
  const NotificationCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
        color: ColorManger.backGround,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  const UserCirclemage(),
                  Expanded(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextManger(
                          message.notification!.title.toString(),
                          style: TextStyleManager.bodyMedium.copyWith(),
                        ),
                        TextManger(
                          message.notification!.body.toString(),
                          style: TextStyleManager.bodyMedium,
                        ),
                        TextManger(
                          message.sentTime!.formatDate,
                          style: TextStyleManager.bodyMediumGrey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
