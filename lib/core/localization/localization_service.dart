import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class LocalizationService {
  final EasyLocalization easyLocalization;

  LocalizationService(this.easyLocalization);

  // Future<void> changeLanguage(Locale locale) async {
  //   await easyLocalization.setLocale(locale);
  // }

  // Locale get currentLocale => easyLocalization.locale;

  List<Locale> get supportedLocales => easyLocalization.supportedLocales;
}
