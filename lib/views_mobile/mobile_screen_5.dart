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

class MobileScreen5 extends ConsumerStatefulWidget {
  const MobileScreen5({super.key});

  @override
  SecondMobileScreenState createState() => SecondMobileScreenState();
}

class SecondMobileScreenState extends ConsumerState<MobileScreen5> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(mProviderManager).mobileScreenProvider5;

    return AnimatedOpacity(
      opacity: ref.watch(provider.screenProvider),
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            Positioned(
              top: 40.r,
              width: 1.sw,
              child: TransitionWithAlignAndOp(
                factor: ref.watch(provider.animProvider1),
                opFactor: ref.watch(provider.animProvider1),
                from: 3,
                to: -0.7,
                isHorizontal: true,
                duration: const Duration(milliseconds: 100),
                child: ImageRenderer(
                    alt: Alts.altList[Images.thirdImg02] ?? "",
                    child: Image.asset(
                      Images.thirdImg02,
                      height: 0.5.sh,
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ),
            Positioned(
              bottom: 0.23.sh,
              width: 1.sw,
              child: TransitionWithAlignAndOp(
                factor: ref.watch(provider.animProvider2),
                opFactor: ref.watch(provider.animProvider2),
                from: -3,
                to: 0.7,
                isHorizontal: true,
                duration: const Duration(milliseconds: 100),
                child: ImageRenderer(
                    alt: Alts.altList[Images.thirdImg01] ?? "",
                    child: Image.asset(
                      Images.thirdImg01,
                      height: 0.5.sh,
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ),
            TransitionWithAlignAndOp(
              factor: ref.watch(provider.animProvider3),
              opFactor: ref.watch(provider.animProvider3),
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
            Positioned(
                bottom: 20.r,
                width: 1.sw,
                child: TransitionWithAlignAndOp(
                    factor: ref.watch(provider.animProvider4),
                    opFactor: ref.watch(provider.animProvider4),
                    from: -3,
                    to: 0,
                    isHorizontal: true,
                    duration: const Duration(milliseconds: 100),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          width: 1.sw,
                          height: 0.2.sh,
                        ),
                        // ImageRenderer(
                        //     alt: "Challenge",
                        //     child: Image.asset(
                        //       Images.thirdFlag,
                        //       height: 0.2.sh,
                        //       fit: BoxFit.fitHeight,
                        //     )),
                        Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            TextRenderer(
                              text: "third_page_title_01".tr(),
                              child: Text(
                                "third_page_title_01".tr(),
                                textAlign: TextAlign.start,
                                style: FontTheme.bold.override(
                                    color: Colors.white, fontSize: 20.spMin),
                              ),
                            ),
                            22.verticalSpace,
                            SizedBox(
                                width: 0.9.sw,
                                child: TextRenderer(
                                  text: "third_page_content_01".tr(),
                                  child: Text(
                                    "third_page_content_01".tr(),
                                    textAlign: TextAlign.start,
                                    style: FontTheme.normal.override(
                                        color: Colors.white,
                                        fontSize: 16.spMin),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
