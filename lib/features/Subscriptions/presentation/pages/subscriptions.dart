import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/upgrade_cubit.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/upgrade_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/subscription_card.dart';

class Subscriptions extends StatelessWidget {
  static const routeName = 'subscriptions/';

  const Subscriptions({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'SubscriptionsNow'),
      body: BlocConsumer<UpgradeCubit, UpgradeState>(
        listener: (context, state) {
          if (state.error != null) {
            if (state.products.isEmpty) context.pop();
            context.errorDialog('${state.error}');
          } else if (state.isUpgraded) {
            context.pop();
            context.read<SubscriptionsBloc>().getSubscriptions();
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              // Subscription cards
              ...state.products.map(
                (product) => SubscriptionCard(
                  product: product,
                  isSelected: state.productDetails?.id == product.id,
                  onSelect: () =>
                      context.read<UpgradeCubit>().selectPlan(product),
                ),
              ),
              const SizedBox(height: 16),

              // Subscribe button
              CustomButton.icon(
                onPressed: () {
                  final product = state.productDetails;
                  if (product != null) {
                    context.read<UpgradeCubit>().purchaseSubscription(product);
                  } else {
                    context.errorDialog('PleaseSelectPlan');
                  }
                },
                shape: const StadiumBorder(),
                icon: Icons.star,
                style: TextStyleManager.bodyLargeWhite,
                text: 'Subscribebutton',
              ),

              const SizedBox(height: 24),

              CustomButton.icon(
                onPressed: () {
                  // context.read<UpgradeCubit>().restorePurchases();
                },
                shape: const StadiumBorder(),
                text: 'CancelSubscriptions',
                icon: Icons.bookmark_remove_outlined,
                style: TextStyleManager.bodyLargeWhite
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ), // Terms & Privacy links
              const TermsAndPolicyWidget(),
            ],
          );
        },
      ),
    );
  }
}

class TermsAndPolicyWidget extends StatelessWidget {
  const TermsAndPolicyWidget({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Text.rich(TextSpan(
              text: 'Bysubscribing ',
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: <TextSpan>[
            TextSpan(
                text: 'TermsOfUse',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchUrl(
                        'https://app.termly.io/dashboard/website/3adc9fc0-47c5-480d-8cc6-a8ce81c7b28e/terms-of-service');
                  }),
            TextSpan(
                text: ' and ',
                style: const TextStyle(fontSize: 18, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '  Privacypolicy',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrl(
                              'https://app.termly.io/dashboard/website/3adc9fc0-47c5-480d-8cc6-a8ce81c7b28e/terms-of-service');
                        })
                ])
          ]))),
    );
  }
}
