import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views_mobile/providers/mobile_provider_manager.dart';
import 'package:stepin_website/widget/basic_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileScreen extends ConsumerStatefulWidget {
  const MobileScreen({super.key});

  @override
  MobileScreenState createState() => MobileScreenState();
}

class MobileScreenState extends ConsumerState<MobileScreen> {
  final pageController = PageController();

  bool lock = false;

  List<int> events = [];
  late Timer scrollTimer;

  double touchDownPosition = 0;

  @override
  void initState() {
    pageController.addListener(() {
      final provider = ref.read(mProviderManager);
      var pageValue = pageController.page ?? 0;

      events.add(1);

      ref.read(provider.pageProvider.notifier).update((state) => pageValue);
    });

    scrollTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (events.isNotEmpty) {
        events.clear();
      } else {
        if (ref.read(ref.read(mProviderManager).isPagingProvider)) {
          ref
              .read(ref.read(mProviderManager).isPagingProvider.notifier)
              .update((state) => false);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor01,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          homeBackgroundSwitcher(),
          Consumer(
            builder: (context, ref, child) {
              return IgnorePointer(
                ignoring:
                    ref.watch(ref.read(mProviderManager).isPagingProvider),
                child: PageView(
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    screen(),
                    screen(),
                    screen(),
                    screen(),
                    screen(),
                    screen(),
                    screen(),
                    screen(),
                  ],
                ),
              );
            },
          ),
          Listener(
              onPointerDown: (event) {
                touchDownPosition = event.position.dy;
              },
              onPointerUp: (event) {
                final provider = ref.read(mProviderManager);
                if (!ref.read(provider.isPagingProvider)) {
                  var elapse = event.position.dy - touchDownPosition;
                  if (elapse.abs() > 5) {
                    ref
                        .read(provider.isPagingProvider.notifier)
                        .update((state) => true);

                    if (elapse < 5) {
                      provider.isForward = true;

                      provider
                          .setPage(((pageController.page ?? 0) + 1).toInt());
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    } else if (elapse > -5) {
                      provider.isForward = false;
                      provider
                          .setPage(((pageController.page ?? 0) - 1).toInt());

                      pageController.previousPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut);
                    }
                  }
                }
              },
              onPointerSignal: (event) {
                final provider = ref.read(mProviderManager);
                if (!ref.read(provider.isPagingProvider)) {
                  if (event is PointerScrollEvent) {
                    if (event.scrollDelta.dy.abs() > 5) {
                      ref
                          .read(provider.isPagingProvider.notifier)
                          .update((state) => true);

                      // 스크롤을 아래로 했다고 판단
                      if (event.scrollDelta.dy > 5) {
                        provider.isForward = true;

                        provider
                            .setPage(((pageController.page ?? 0) + 1).toInt());
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                      // 스크롤을 위로 했다고 판단
                      else if (event.scrollDelta.dy < -5) {
                        provider.isForward = false;
                        provider
                            .setPage(((pageController.page ?? 0) - 1).toInt());

                        pageController.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut);
                      }
                    }
                  }
                }
              },
              child: mobileScreen()),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: ref.watch(ref.read(mProviderManager).ctaProvider),
            child: CTAWidget(),
          )
        ],
      ),
    );
  }

  Widget homeBackgroundSwitcher() {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.read(mProviderManager);
      final page = ref.watch(provider.pageProvider);

      var factor = page % 1;
      if (factor == 0) {
        if (provider.isForward) {
          factor = 1;
        } else {
          factor = 0;
        }
      }

      final backgrounds = provider.getBackgroundImage();

      return SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Opacity(
                opacity: factor,
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          backgrounds[1],
                        ).image,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Opacity(
                opacity: 1 - factor,
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          backgrounds[0],
                        ).image,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ));
    });
  }

  Widget screen() {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
    );
  }

  Widget mobileScreen() {
    return Consumer(
      builder: (context, ref, child) {
        final provider = ref.read(mProviderManager);
        final page = ref.watch(provider.pageProvider);

        var factor = page % 1;
        if (factor == 0) {
          if (provider.isForward) {
            factor = 1;
          } else {
            factor = 0;
          }
        }

        final widget = provider.getMobileScreen();

        return SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: 1 - factor == 0,
                  child: Opacity(opacity: 1 - factor, child: widget[0]),
                ),
                IgnorePointer(
                  ignoring: factor == 0,
                  child: Opacity(opacity: factor, child: widget[1]),
                ),
              ],
            ));
      },
    );
  }

  Widget CTAWidget() {
    return Row(
      children: [iOSButtonWidget(), 20.horizontalSpace, androidButtonWidget()],
    );
  }

  Widget androidButtonWidget() {
    return BasicButton(
        tapCallback: () {
          launchUrl(Uri.parse(
              "https://play.google.com/store/apps/details?id=com.sidewalk.stepin"));
        },
        child: ImageRenderer(
            alt: Alts.altList[Images.googleButton] ?? "",
            child: Image.asset(
              Images.googleButton,
              width: 0.4.sw,
              fit: BoxFit.fitWidth,
            )));
  }

  Widget iOSButtonWidget() {
    return BasicButton(
        tapCallback: () {
          launchUrl(Uri.parse(
              "https://apps.apple.com/us/app/stepin-k-pop-dance/id6443893517"));
        },
        child: ImageRenderer(
            alt: Alts.altList[Images.appleButton] ?? "",
            child: Image.asset(
              Images.appleButton,
              width: 0.4.sw,
              fit: BoxFit.fitWidth,
            )));
  }
}
