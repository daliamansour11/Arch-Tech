import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../enum/enum_type.dart';

part 'html__state.dart';
class HtmlCubit extends Cubit<HtmlState> {
  HtmlCubit() : super(const HtmlState());

  Future<void> loadHtml(HtmlType type, {String langCode = 'en'}) async {
    try {
      emit(state.copyWith(isLoading: true));

      String path;
      switch (type) {
        case HtmlType.termsAndCondition:
          path = langCode == 'ar' ? 'assets/html/ar/terms.html' : 'assets/html/en/terms.html';
          break;
        case HtmlType.privacyPolicy:
          path = langCode == 'ar' ? 'assets/html/ar/privacy_policy.html' : 'assets/html/en/privacy_policy.html';
          break;
        default:
          path = '';
      }

      final htmlText = path.isNotEmpty
          ? await rootBundle.loadString(path)
          : '<p>No content found</p>';

      emit(state.copyWith(isLoading: false, htmlText: htmlText));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
