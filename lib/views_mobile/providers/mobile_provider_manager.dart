import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/views_mobile/first_mobile_screen.dart';
import 'package:stepin_website/views_mobile/mobile_screen_3.dart';
import 'package:stepin_website/views_mobile/mobile_screen_4.dart';
import 'package:stepin_website/views_mobile/mobile_screen_5.dart';
import 'package:stepin_website/views_mobile/mobile_screen_6.dart';
import 'package:stepin_website/views_mobile/mobile_screen_7.dart';
import 'package:stepin_website/views_mobile/mobile_screen_8.dart';
import 'package:stepin_website/views_mobile/providers/first_mobile_screen_provider.dart';
import 'package:stepin_website/views_mobile/providers/mobile_screen_provider.dart';
import 'package:stepin_website/views_mobile/mobile_screen_2.dart';

final mProviderManager = Provider((ref) => MobileProviderManager(ref: ref));

class MobileProviderManager {
  ProviderRef ref;
  MobileProviderManager({required this.ref}) {
    firstScreenProvider.startFirstScreenAnimation();
  }

  final pageProvider = StateProvider((ref) => 0.0);
  final isPagingProvider = StateProvider((ref) => false);
  List<String> prevBackground = [];
  List<Widget> prevScreen = [];
  bool isForward = false;

  final ctaProvider = StateProvider((ref) => -200.h);

  late final firstScreenProvider = FirstMobileScreenProvider(ref: ref);
  late final mobileScreenProvider2 = MobileScreenProvider2(ref: ref);
  late final mobileScreenProvider3 = MobileScreenProvider3(ref: ref);
  late final mobileScreenProvider4 = MobileScreenProvider4(ref: ref);
  late final mobileScreenProvider5 = MobileScreenProvider5(ref: ref);
  late final mobileScreenProvider6 = MobileScreenProvider5(ref: ref);
  late final mobileScreenProvider7 = MobileScreenProvider5(ref: ref);
  late final mobileScreenProvider8 = MobileScreenProvider5(ref: ref);

  showCTA(bool isShow) {
    if (isShow) {
      ref.read(ctaProvider.notifier).update((state) => 30.r);
    } else {
      ref.read(ctaProvider.notifier).update((state) => -200.h);
    }
  }

  showCTAAT(double positionY) {
    ref.read(ctaProvider.notifier).update((state) => positionY);
  }

  setPage(int toPage) {
    final page = toPage;

    switch (page) {
      case 0:
        () async {
          await firstScreenProvider.startFirstScreenAnimation();
          showCTA(true);
        }();

        mobileScreenProvider2.stopAnimation();

        break;
      case 1:
        mobileScreenProvider2.startAnimation();
        firstScreenProvider.stopFirstScreenAnimation();
        mobileScreenProvider3.stopAnimation();
        showCTA(false);
        break;
      case 2:
        mobileScreenProvider2.stopAnimation();
        mobileScreenProvider3.startAnimation();
        mobileScreenProvider4.stopAnimation();
        showCTA(false);
        break;
      case 3:
        mobileScreenProvider3.stopAnimation();
        mobileScreenProvider4.startAnimation();
        mobileScreenProvider5.stopAnimation();
        showCTA(false);
        break;
      case 4:
        mobileScreenProvider4.stopAnimation();
        mobileScreenProvider5.startAnimation();
        mobileScreenProvider6.stopAnimation();
        showCTA(false);
        break;
      case 5:
        mobileScreenProvider5.stopAnimation();
        mobileScreenProvider6.startAnimation();
        mobileScreenProvider7.stopAnimation();
        showCTA(false);
        break;
      case 6:
        mobileScreenProvider6.stopAnimation();
        mobileScreenProvider7.startAnimation();
        mobileScreenProvider8.stopAnimation();
        showCTA(false);
        showCTA(false);
        break;
      case 7:
        mobileScreenProvider7.stopAnimation();
        () async {
          await mobileScreenProvider8.startAnimation();

          showCTAAT(0.35.sh);
        }();

        break;
    }
  }

  List<String> getBackgroundImage() {
    final pageValue = ref.read(pageProvider);
    if (pageValue >= 0 && pageValue < 1) {
      return prevBackground = [Images.background1, Images.background2];
    } else if (pageValue > 1 && pageValue < 2) {
      return prevBackground = [Images.background2, Images.background2];
    } else if (pageValue > 2 && pageValue < 3) {
      return prevBackground = [Images.background2, Images.background2];
    } else if (pageValue > 3 && pageValue < 4) {
      return prevBackground = [Images.background2, Images.background3];
    } else if (pageValue > 4 && pageValue < 5) {
      return prevBackground = [Images.background3, Images.background3];
    } else if (pageValue > 5 && pageValue < 6) {
      return prevBackground = [Images.background3, Images.background4];
    } else if (pageValue > 6 && pageValue < 7) {
      return prevBackground = [Images.background4, Images.background5];
    } else {
      return prevBackground;
    }
  }

  List<Widget> getMobileScreen() {
    final pageValue = ref.read(pageProvider);
    if (pageValue >= 0 && pageValue < 1) {
      return prevScreen = [const FirstMobileScreen(), const MobileScreen2()];
    } else if (pageValue > 1 && pageValue < 2) {
      return prevScreen = [const MobileScreen2(), const MobileScreen3()];
    } else if (pageValue > 2 && pageValue < 3) {
      return prevScreen = [const MobileScreen3(), const MobileScreen4()];
    } else if (pageValue > 3 && pageValue < 4) {
      return prevScreen = [const MobileScreen4(), const MobileScreen5()];
    } else if (pageValue > 4 && pageValue < 5) {
      return prevScreen = [const MobileScreen5(), const MobileScreen6()];
    } else if (pageValue > 5 && pageValue < 6) {
      return prevScreen = [const MobileScreen6(), const MobileScreen7()];
    } else if (pageValue > 6 && pageValue < 7) {
      return prevScreen = [const MobileScreen7(), const MobileScreen8()];
    } else {
      return prevScreen;
    }
  }
}
