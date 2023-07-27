import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:stepin_website/configurations/environment.dart';
import 'package:stepin_website/configurations/routes/routes.dart';
import 'package:stepin_website/configurations/styles/styles.dart';

void main() {
  Main();
}

class Main extends WebEnvironment {
  @override
  FutureOr<Widget> onCreate() {
    ErrorWidget.builder = (details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.white);
    };

    return Web();
  }
}

class Web extends StatelessWidget {
  Web({Key? key}) : super(key: key);

  final _appRouter = WebRouter();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return RobotDetector(
      debug: true,
      child: ProviderScope(
        child: MaterialApp.router(
          color: Palette.primaryColor01,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          title: "Dance Up with STEPIN. AI Driven K-Pop Dance Platform",
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
