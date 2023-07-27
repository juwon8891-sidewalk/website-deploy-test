import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views/providers/provider_manager.dart';
import 'dart:math' as math;

import 'package:stepin_website/widget/transition.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
                    Images.background3,
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
          // topWidget(),
          // bottomWidget(),
          topWidget(),
          bottomWidget()
        ],
      ),
    );
  }

  Widget topWidget() {
    return Positioned(
      top: 100.spMin,
      child: Consumer(
        builder: (context, ref, child) {
          final provider = ref.read(providerManager).thirdScreenProvider;
          return Wrap(children: [
            SizedBox(
              width: 1200.spMin,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  TransitionWithAlign(
                    factor: ref.watch(provider.animProvider5),
                    from: -1,
                    to: 0,
                    duration: const Duration(milliseconds: 300),
                    isHorizontal: true,
                    hasOpacity: true,
                    child: SizedBox(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ImageRenderer(
                              alt: Alts.altList[Images.thirdFlag] ?? "",
                              child: Image.asset(
                                Images.thirdFlag,
                                width: 1200.spMin,
                                fit: BoxFit.fitWidth,
                              )),
                          Align(
                            alignment: const AlignmentDirectional(-0.65, 0),
                            child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                TextRenderer(
                                  text: "third_page_title_01".tr(),
                                  child: Text(
                                    "third_page_title_01".tr(),
                                    textAlign: TextAlign.end,
                                    style: FontTheme.bold.override(
                                        color: Colors.white,
                                        fontSize: 24.spMin),
                                  ),
                                ),
                                22.verticalSpace,
                                SizedBox(
                                    width: 456.spMin,
                                    child: TextRenderer(
                                      text: "third_page_content_01".tr(),
                                      child: Text(
                                        "third_page_content_01".tr(),
                                        textAlign: TextAlign.end,
                                        style: FontTheme.normal.override(
                                            color: Colors.white,
                                            fontSize: 16.spMin),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TransitionWithAlign(
                    factor: ref.watch(provider.animProvider1),
                    from: 0,
                    to: 1,
                    duration: const Duration(milliseconds: 300),
                    hasOpacity: true,
                    isHorizontal: true,
                    child: ImageRenderer(
                        alt: Alts.altList[Images.thirdImg02] ?? "",
                        child: Image.asset(
                          Images.thirdImg02,
                          width: 260.spMin,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  TransitionWithAlign(
                    factor: ref.watch(provider.animProvider2),
                    from: -0.35,
                    to: 0.35,
                    duration: const Duration(milliseconds: 300),
                    isHorizontal: true,
                    hasOpacity: true,
                    child: ImageRenderer(
                        alt: Alts.altList[Images.thirdImg01] ?? "",
                        child: Image.asset(
                          Images.thirdImg01,
                          width: 260.spMin,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }

  Widget bottomWidget() {
    return Positioned(
      bottom: 100.spMin,
      child: Consumer(
        builder: (context, ref, child) {
          final provider = ref.read(providerManager).thirdScreenProvider;
          return Wrap(children: [
            SizedBox(
              width: 1200.spMin,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  TransitionWithAlign(
                    factor: ref.watch(provider.animProvider5),
                    from: -1,
                    to: 0,
                    isHorizontal: true,
                    duration: const Duration(milliseconds: 300),
                    hasOpacity: true,
                    child: SizedBox(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: ImageRenderer(
                                  alt: Alts.altList[Images.thirdFlag] ?? "",
                                  child: Image.asset(
                                    Images.thirdFlag,
                                    width: 1200.spMin,
                                    fit: BoxFit.fitWidth,
                                  ))),
                          Align(
                            alignment: const AlignmentDirectional(0.65, 0),
                            child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                TextRenderer(
                                  text: "third_page_title_02".tr(),
                                  child: Text(
                                    "third_page_title_02".tr(),
                                    textAlign: TextAlign.start,
                                    style: FontTheme.bold.override(
                                        color: Colors.white,
                                        fontSize: 24.spMin),
                                  ),
                                ),
                                22.verticalSpace,
                                SizedBox(
                                    width: 456.spMin,
                                    child: TextRenderer(
                                      text: "third_page_content_02".tr(),
                                      child: Text(
                                        "third_page_content_02".tr(),
                                        textAlign: TextAlign.start,
                                        style: FontTheme.normal.override(
                                            color: Colors.white,
                                            fontSize: 16.spMin),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TransitionWithAlign(
                    factor: ref.watch(provider.animProvider3),
                    from: 0,
                    to: -1,
                    duration: const Duration(milliseconds: 300),
                    hasOpacity: true,
                    isHorizontal: true,
                    child: ImageRenderer(
                        alt: Alts.altList[Images.thirdImg04] ?? "",
                        child: Image.asset(
                          Images.thirdImg04,
                          width: 260.spMin,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  TransitionWithAlign(
                    factor: ref.watch(provider.animProvider4),
                    from: 0.35,
                    to: -0.35,
                    duration: const Duration(milliseconds: 300),
                    hasOpacity: true,
                    isHorizontal: true,
                    child: ImageRenderer(
                        alt: Alts.altList[Images.thirdImg03] ?? "",
                        child: Image.asset(
                          Images.thirdImg03,
                          width: 260.spMin,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
