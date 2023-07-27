import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class WebEnvironment {
  FutureOr<Widget> onCreate();

  WebEnvironment() {
    runZonedGuarded(() => init(), (error, stack) {});
  }

  void init() async {
    await EasyLocalization.ensureInitialized();

    final page = await onCreate();

    runApp(EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('kr')],
        fallbackLocale: const Locale('en'),
        path: 'assets/localization',
        child: page));
  }
}
