import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views/providers/provider_manager.dart';
import 'package:stepin_website/widget/basic_button.dart';
import 'package:stepin_website/widget/transition.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstScreen extends ConsumerStatefulWidget {
  const FirstScreen({super.key});

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends ConsumerState<FirstScreen> {
  @override
  void initState() {
    ref.read(providerManager).firstScreenProvider.startFirstScreenAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Palette.primaryColor01,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(
                    Images.background1,
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
          titleWidget()
        ],
      ),
    );
  }

  Widget titleWidget() {
    final provider = ref.read(providerManager).firstScreenProvider;
    return Positioned(
        bottom: 92.h,
        child: SizedBox(
            width: 1200.spMin,
            child: Consumer(builder: (context, ref, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TransitionToLeftWidget(
                      factor: 1 -
                          ref.watch(ref
                              .read(providerManager)
                              .firstScreenProvider
                              .animProvider1),
                      amount: 100.r,
                      duration: const Duration(milliseconds: 200),
                      child: AnimatedOpacity(
                          opacity: ref.watch(provider.animProvider1),
                          duration: const Duration(milliseconds: 200),
                          child: ImageRenderer(
                              alt: Alts.altList[Images.homeTitle01] ?? "",
                              child: Image.asset(
                                Images.homeTitle01,
                                height: 116.h,
                                fit: BoxFit.fitHeight,
                              )))),
                  20.verticalSpace,
                  TransitionToLeftWidget(
                      factor: 1 - ref.watch(provider.animProvider2),
                      amount: 100.r,
                      duration: const Duration(milliseconds: 200),
                      child: AnimatedOpacity(
                          opacity: ref.watch(provider.animProvider2),
                          duration: const Duration(milliseconds: 200),
                          child: ImageRenderer(
                              alt: Alts.altList[Images.homeTitle02] ?? "",
                              child: Image.asset(
                                Images.homeTitle02,
                                height: 126.h,
                                fit: BoxFit.fitHeight,
                              )))),
                  60.verticalSpace,
                  AnimatedOpacity(
                      opacity: ref.watch(provider.animProvider3),
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text1Widget(),
                          20.verticalSpace,
                          text2Widget()
                        ],
                      ))),
                  60.verticalSpace,
                  AnimatedOpacity(
                      opacity: ref.watch(provider.animProvider3),
                      duration: const Duration(milliseconds: 200),
                      child: CTAWidget())
                ],
              );
            })));
  }

  Widget text1Widget() {
    return TextRenderer(
      text: "first_page_content_01".tr(),
      child: Text(
        "first_page_content_01".tr(),
        style: FontTheme.bold.override(color: Colors.white, fontSize: 24.spMin),
      ),
    );
  }

  Widget text2Widget() {
    return TextRenderer(
      text: "first_page_content_02".tr(),
      child: Text(
        "first_page_content_02".tr(),
        style:
            FontTheme.normal.override(color: Colors.white, fontSize: 20.spMin),
      ),
    );
  }

  Widget CTAWidget() {
    return Row(
      children: [iOSButtonWidget(), 40.horizontalSpace, androidButtonWidget()],
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
              width: 356.spMin,
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
              width: 356.spMin,
              fit: BoxFit.fitWidth,
            )));
  }
}
