import 'package:archtech/core/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale.freezed.dart';

@freezed
class AppLocale with _$AppLocale {
  const factory AppLocale({
    required String name,
    required String code,
  }) = _AppLocale;
}

final class AppLocalesUtils {
  const AppLocalesUtils._();
  static List<AppLocale> getAppLocales = const [
    AppLocale(name: 'English', code: 'en'),
    AppLocale(name: 'العربية', code: 'ar'),
    AppLocale(name: 'French', code: 'fr'),
    AppLocale(name: 'China', code: 'zh'),
  ];
  static final List<String> codes = getAppLocales.map((e) => e.code).toList();
  static Iterable<Locale> supportedLocales =
      getAppLocales.map((e) => Locale(e.code)).toList();
  static Future<AppLocale> getAppLocale() async {
    final Injection injection = Injection.instance;
    final String? code = await injection.cacheHelper.getData(key: 'locale');
    if (code != null) {
      return getAppLocales.firstWhere((element) => element.code == code,
          orElse: () => getAppLocales.first);
    }

    // Get the device's default locale code
    final deviceLocaleCode = PlatformDispatcher.instance.locale.languageCode;

    // Find the corresponding AppLocale for the device's language code
    return getAppLocales.firstWhere(
      (element) => element.code == deviceLocaleCode,
      orElse: () => getAppLocales.first,
    );
  }
}
