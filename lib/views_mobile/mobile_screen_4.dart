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

class MobileScreen4 extends ConsumerStatefulWidget {
  const MobileScreen4({super.key});

  @override
  SecondMobileScreenState createState() => SecondMobileScreenState();
}

class SecondMobileScreenState extends ConsumerState<MobileScreen4> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(mProviderManager).mobileScreenProvider4;

    return AnimatedOpacity(
      opacity: ref.watch(provider.screenProvider),
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            TransitionWithAlignAndOp(
              factor: ref.watch(provider.animProvider1),
              opFactor: ref.watch(provider.animProvider1),
              from: -2,
              to: 0,
              isHorizontal: false,
              duration: const Duration(milliseconds: 200),
              child: titleWidget(),
            ),
            TransitionWithAlignAndOp(
              factor: ref.watch(provider.animProvider2),
              opFactor: ref.watch(provider.animProvider2),
              from: 0,
              to: 0,
              isHorizontal: false,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 1.sw,
                height: 1.sh,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            TransitionWithAlignAndOp(
              factor: ref.watch(provider.animProvider3),
              opFactor: ref.watch(provider.animProvider3),
              from: -2,
              to: 0,
              isHorizontal: true,
              duration: const Duration(milliseconds: 100),
              child: SizedBox(
                  width: 290.spMin,
                  height: 290.spMin * 1.8,
                  child: thirdDiscription()),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleWidget() {
    return ImageRenderer(
        alt: Alts.altList[Images.secondImg03] ?? "",
        child: Image.asset(
          Images.secondImg03,
          width: 312.spMin,
          fit: BoxFit.fitWidth,
        ));
  }

  Widget thirdDiscription() {
    return SizedBox(
      width: 312.spMin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRenderer(
                text: "second_page_title_03".tr(),
                child: Text(
                  "second_page_title_03".tr(),
                  style: FontTheme.bold
                      .override(color: Colors.white, fontSize: 24.spMin),
                ),
              ),
              22.verticalSpace,
              TextRenderer(
                text: "second_page_content_03".tr(),
                child: Text(
                  "second_page_content_03".tr(),
                  style: FontTheme.normal
                      .override(color: Colors.white, fontSize: 16.spMin),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
