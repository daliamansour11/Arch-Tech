import 'package:archtech/core/extension/format_date_time_on_date_time.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Subscriptions/data/subscriptions_model.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscribedDetailsCard extends StatelessWidget {
  final SubscriptionsModel subscriptionsModel;

  const SubscribedDetailsCard({
    super.key,
    required this.subscriptionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              ColorManger.primary,
              ColorManger.orange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 4,
              children: [
                const TextManger(
                  'Subscription',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextManger(
                  subscriptionsModel.title!.split('.').last,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SubRow(
              date: DateTime.tryParse(subscriptionsModel.startAt ?? '')
                      ?.formatDate ??
                  '',
              hint: 'SubScriptionDate',
            ),
            const SizedBox(height: 12),
            SubRow(
              date: DateTime.tryParse(subscriptionsModel.endAt ?? '')
                      ?.formatDate ??
                  '',
              hint: 'ExpiryDate',
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SubscriptionsBloc>().cancelSubscription();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: ColorManger.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const TextManger(
                  'CancelSubscription',
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorManger.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubRow extends StatelessWidget {
  final String hint;
  final String date;
  const SubRow({
    super.key,
    required this.date,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        TextManger(
          hint,
          style: TextStyleManager.bodyMediumWhiteBold,
        ),
        const Text(
          ':',
          style: TextStyleManager.bodyMediumWhiteBold,
        ),
        Text(
          date,
          style: TextStyleManager.bodyMediumWhiteBold,
        ),
      ],
    );
  }
}