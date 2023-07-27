import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views/providers/provider_manager.dart';
import 'package:stepin_website/widget/transition.dart';

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends ConsumerState<SecondScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(providerManager).secondScreenProvider;

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
                    Images.background2,
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
              width: 1200.spMin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TransitionToBototmWidget(
                      factor: 1 - ref.watch(provider.animProvider1),
                      amount: 100.r,
                      duration: const Duration(milliseconds: 200),
                      child: firstDiscription(),
                      hasOpacity: true),
                  TransitionToBototmWidget(
                      factor: 1 - ref.watch(provider.animProvider2),
                      amount: 100.r,
                      duration: const Duration(milliseconds: 200),
                      child: secondDiscription(),
                      hasOpacity: true),
                  TransitionToBototmWidget(
                      factor: 1 - ref.watch(provider.animProvider3),
                      amount: 100.r,
                      duration: const Duration(milliseconds: 200),
                      child: thirdDiscription(),
                      hasOpacity: true),
                ],
              ))
        ],
      ),
    );
  }

  Widget firstDiscription() {
    return SizedBox(
        width: 312.spMin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageRenderer(
                alt: Alts.altList[Images.secondImg01] ?? "",
                child: Image.asset(
                  Images.secondImg01,
                  width: 312.spMin,
                  fit: BoxFit.fitWidth,
                )),
            45.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRenderer(
                  text: "second_page_title_01".tr(),
                  child: Text(
                    "second_page_title_01".tr(),
                    style: FontTheme.bold
                        .override(color: Colors.white, fontSize: 24.spMin),
                  ),
                ),
                22.verticalSpace,
                TextRenderer(
                  text: "second_page_content_01".tr(),
                  child: Text(
                    "second_page_content_01".tr(),
                    style: FontTheme.normal
                        .override(color: Colors.white, fontSize: 16.spMin),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget secondDiscription() {
    return SizedBox(
      width: 312.spMin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageRenderer(
              alt: Alts.altList[Images.secondImg02] ?? "",
              child: Image.asset(
                Images.secondImg02,
                width: 312.spMin,
                fit: BoxFit.fitWidth,
              )),
          45.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRenderer(
                text: "second_page_title_02".tr(),
                child: Text(
                  "second_page_title_02".tr(),
                  style: FontTheme.bold
                      .override(color: Colors.white, fontSize: 24.spMin),
                ),
              ),
              22.verticalSpace,
              TextRenderer(
                text: "second_page_content_02".tr(),
                child: Text(
                  "second_page_content_02".tr(),
                  style: FontTheme.normal
                      .override(color: Colors.white, fontSize: 16.spMin),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget thirdDiscription() {
    return SizedBox(
      width: 312.spMin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageRenderer(
              alt: Alts.altList[Images.secondImg03] ?? "",
              child: Image.asset(
                Images.secondImg03,
                width: 312.spMin,
                fit: BoxFit.fitWidth,
              )),
          45.verticalSpace,
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
