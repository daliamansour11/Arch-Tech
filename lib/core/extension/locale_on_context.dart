import 'dart:ui';

import 'package:archtech/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocaleExt on BuildContext {
  String translate(String key) =>
      AppLocalizations.of(this)?.translate(key) ?? key;
  Locale get currentLocale => Localizations.localeOf(this);
  FlutterView get view => View.of(this);
  PlatformDispatcher get platformDispatcher => view.platformDispatcher;
  Locale get locale => platformDispatcher.locale;
  String get localeCode => locale.languageCode;
}
