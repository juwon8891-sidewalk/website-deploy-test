import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views/final_screen.dart';
import 'package:stepin_website/views/first_screen.dart';
import 'package:stepin_website/views/forth_screen.dart';
import 'package:stepin_website/views/providers/provider_manager.dart';
import 'package:stepin_website/views/providers/second_screen_provider.dart';
import 'package:stepin_website/views/providers/third_screen_provider.dart';
import 'package:stepin_website/views/second_screen.dart';
import 'package:stepin_website/views/third_screen.dart';
import 'package:stepin_website/views_mobile/mobile_screen.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 800) {
      return mobile();
    } else {
      return desktop();
    }
  }

  Widget mobile() {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context, child) {
          return const MobileScreen();
        });
  }

  Widget desktop() {
    return ScreenUtilInit(
      designSize: const Size(1290, 1080),
      builder: (context, child) {
        return Scaffold(
            backgroundColor: Palette.primaryColor01,
            body: Consumer(
              builder: (context, ref, child) {
                return SingleChildScrollView(
                  controller: scrollController
                    ..addListener(() {
                      /// Second animation
                      if (scrollController.offset > 1.sh * 0.6 &&
                          !SecondScreenProvider.isAnimated) {
                        ref
                            .read(providerManager)
                            .secondScreenProvider
                            .startSecondScreenAnimation();
                      }
                      if (scrollController.offset > 1.sh * 1.6 &&
                          !ThirdScreenProvider.isAnimated) {
                        ref
                            .read(providerManager)
                            .thirdScreenProvider
                            .startThirdScreenAnimation();
                      }
                    }),
                  child: const Column(
                    children: [
                      FirstScreen(),
                      SecondScreen(),
                      ThirdScreen(),
                      ForthScreen(),
                      FinalScreen()
                    ],
                  ),
                );
              },
            ));
      },
    );
  }
}
