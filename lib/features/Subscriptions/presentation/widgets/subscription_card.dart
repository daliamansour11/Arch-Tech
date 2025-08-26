import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionCard extends StatelessWidget {
  final ProductDetails product;
  final bool isSelected;
  final VoidCallback onSelect;

  const SubscriptionCard({
    super.key,
    required this.product,
    required this.isSelected,
    required this.onSelect,
  });

  String getDuration(ProductDetails product) {
    return product.subscriptionPeriod ?? 'Durationnotspecified';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color:
          isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onSelect,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & check
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title.split('(ARCH TECH)').first,
                    style: TextStyleManager.headlineLarge,
                  ),
                  if (isSelected)
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Price
              Text(
                product.price,
                style: TextStyleManager.bodyLargePrimary,
              ),
              const SizedBox(height: 4),

              // Duration
              Text(
                getDuration(product),
                style: TextStyleManager.bodyMediumGrey,
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                product.description,
                style: TextStyleManager.bodyMediumGrey,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
