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

class MobileScreen7 extends ConsumerStatefulWidget {
  const MobileScreen7({super.key});

  @override
  SecondMobileScreenState createState() => SecondMobileScreenState();
}

class SecondMobileScreenState extends ConsumerState<MobileScreen7> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(mProviderManager).mobileScreenProvider7;

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
                from: 3,
                to: -0.7,
                isHorizontal: false,
                duration: const Duration(milliseconds: 100),
                child: leftWidget()),
            TransitionWithAlignAndOp(
                factor: ref.watch(provider.animProvider2),
                opFactor: ref.watch(provider.animProvider2),
                from: 0,
                to: 0.8,
                isHorizontal: false,
                duration: const Duration(milliseconds: 100),
                child: rightWidget()),
          ],
        ),
      ),
    );
  }

  Widget leftWidget() {
    return Transform.scale(
        scale: 1.1,
        child: ImageRenderer(
            alt: Alts.altList[Images.forthImg01] ?? "",
            child: Image.asset(
              Images.forthImg01,
              height: 0.6.sh,
              fit: BoxFit.fitWidth,
            )));
  }

  Widget rightWidget() {
    return Container(
        width: 0.8.sw,
        height: 0.6.sh,
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageRenderer(
                alt: Alts.altList[Images.forthImg02] ?? "",
                child: Image.asset(Images.forthImg02)),
            40.verticalSpace,
            SizedBox(
                child: TextRenderer(
              text: "forth_page_content_01".tr(),
              child: Text(
                "forth_page_content_01".tr(),
                textAlign: TextAlign.start,
                style: FontTheme.normal
                    .override(color: Colors.white, fontSize: 16.spMin),
              ),
            ))
          ],
        ));
  }
}
