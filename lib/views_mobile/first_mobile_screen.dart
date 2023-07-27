import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views_mobile/providers/mobile_provider_manager.dart';
import 'package:stepin_website/widget/transition.dart';

class FirstMobileScreen extends ConsumerStatefulWidget {
  const FirstMobileScreen({super.key});

  @override
  FirstMobileScreenState createState() => FirstMobileScreenState();
}

class FirstMobileScreenState extends ConsumerState<FirstMobileScreen> {
  @override
  void initState() {
    ref.read(mProviderManager).setPage(0);
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
            children: [background(), titleWidget()]));
  }

  Widget background() {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset(
              Images.background1,
            ).image,
            fit: BoxFit.cover),
      ),
    );
  }

  Widget titleWidget() {
    final provider = ref.read(mProviderManager).firstScreenProvider;

    return Consumer(
      builder: (context, ref, child) {
        return SizedBox(
          width: 0.8.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TransitionToLeftWidget(
                  factor: 1 -
                      ref.watch(ref
                          .read(mProviderManager)
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
                            width: 0.6.sw,
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
                            width: 0.7.sw,
                            fit: BoxFit.fitHeight,
                          )))),
              60.verticalSpace,
              AnimatedOpacity(
                  opacity: ref.watch(provider.animProvider3),
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [text1Widget(), 20.verticalSpace, text2Widget()],
                  ))),
              30.verticalSpace,
              stepinWidget()
            ],
          ),
        );
      },
    );
  }

  Widget text1Widget() {
    return TextRenderer(
      text: "first_page_content_01".tr(),
      child: Text(
        "first_page_content_01".tr(),
        style: FontTheme.bold.override(color: Colors.white, fontSize: 20.spMin),
      ),
    );
  }

  Widget text2Widget() {
    return TextRenderer(
      text: "first_page_content_02".tr(),
      child: Text(
        "first_page_content_02".tr(),
        style:
            FontTheme.normal.override(color: Colors.white, fontSize: 16.spMin),
      ),
    );
  }

  Widget stepinWidget() {
    return Align(
        alignment: AlignmentDirectional.center,
        child: Consumer(
          builder: (context, ref, child) {
            final provider = ref.read(mProviderManager).firstScreenProvider;
            return AnimatedOpacity(
                opacity: ref.watch(provider.animProvider3),
                duration: const Duration(milliseconds: 200),
                child: ImageRenderer(
                  alt: Alts.altList[Images.stepinIcon] ?? "",
                  child: Image.asset(
                    Images.stepinIcon,
                    width: .2.sw,
                  ),
                ));
          },
        ));
  }
}
