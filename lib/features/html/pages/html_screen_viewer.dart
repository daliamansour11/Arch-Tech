import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../bloc/html__cubit.dart';
import '../enum/enum_type.dart';
class HtmlViewerScreen extends StatelessWidget {
  final HtmlType htmlType;
  static const routeName = 'htmlViewerScreen/';

  const HtmlViewerScreen({super.key, required this.htmlType});

  @override
  Widget build(BuildContext context) {
    // Get current locale language code
    String langCode = Localizations.localeOf(context).languageCode;

    return BlocProvider(
      create: (_) => HtmlCubit()..loadHtml(htmlType, langCode: langCode),
      child: BlocBuilder<HtmlCubit, HtmlState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_getTitle(context, htmlType)),
            ),

            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.error != null
                ? Center(child: Text('Error: ${state.error}'))
                : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: HtmlWidget(
                state.htmlText ?? '<p>No content available</p>',
              ),
            ),
          );
        },
      ),
    );
  }

  String _getTitle(BuildContext context, HtmlType type) {
    switch (type) {
      case HtmlType.termsAndCondition:
        return context.translate('terms_and_conditions');
      case HtmlType.privacyPolicy:
        return context.translate('privacy_policy');
      case HtmlType.aboutUs:
        return context.translate('about_us');
      case HtmlType.shippingPolicy:
        return context.translate('shipping_policy');
      case HtmlType.refund:
        return context.translate('refund_policy');
      case HtmlType.cancellation:
        return context.translate('cancellation_policy');
      default:
        return context.translate('info');
    }
  }

}

