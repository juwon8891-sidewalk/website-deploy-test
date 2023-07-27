import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views_mobile/providers/mobile_provider_manager.dart';
import 'package:stepin_website/widget/basic_button.dart';
import 'package:stepin_website/widget/transition.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileScreen8 extends ConsumerStatefulWidget {
  const MobileScreen8({super.key});

  @override
  SecondMobileScreenState createState() => SecondMobileScreenState();
}

class SecondMobileScreenState extends ConsumerState<MobileScreen8> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(mProviderManager).mobileScreenProvider8;

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
                from: -0.8,
                to: -0.4,
                isHorizontal: false,
                duration: const Duration(milliseconds: 100),
                child: fifthWidget()),
            Positioned(
              bottom: 0.05.sh,
              child: SizedBox(
                child: AnimatedOpacity(
                  opacity: ref.watch(provider.animProvider1),
                  duration: const Duration(milliseconds: 100),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconLineWidget(),
                          40.verticalSpace,
                          eulaLineWidget(),
                          20.verticalSpace,
                          sidewalkWidget(),
                          8.verticalSpace,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget fifthWidget() {
    return SizedBox(
        width: 1.sw,
        height: 0.5.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageRenderer(
                alt: Alts.altList[Images.stepinIcon] ?? "",
                child: Image.asset(
                  Images.stepinIcon,
                  width: 0.2.sw,
                )),
            30.verticalSpace,
            ImageRenderer(
                alt: Alts.altList[Images.fifthImg01] ?? "",
                child: Image.asset(
                  Images.fifthImg01,
                  width: 0.8.sw,
                )),
          ],
        ));
  }

  Widget iconLineWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ImageRenderer(
                alt: Alts.altList[Images.BI] ?? "",
                child: Image.asset(
                  Images.BI,
                  width: 0.2.sw,
                )),
            20.horizontalSpace,
            Text(
              "X",
              style: FontTheme.bold.override(
                color: Colors.white.withOpacity(0.2),
                fontSize: 32.spMin,
              ),
            ),
            20.horizontalSpace,
            BasicButton(
                tapCallback: () {
                  launchUrl(Uri.parse("https://sidewalkplay.com"));
                },
                child: ImageRenderer(
                    alt: Alts.altList[Images.CI] ?? "",
                    child: Image.asset(
                      Images.CI,
                      width: 0.2.sw,
                    ))),
          ],
        ),
        15.verticalSpace,
        SizedBox(
            width: 0.8.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                socialButton(Images.instagram,
                    "https://www.instagram.com/stepin.official/"),
                socialButton(Images.youtube,
                    "https://www.youtube.com/@stepin.official/"),
                socialButton(
                    Images.tiktok, "https://www.tiktok.com/@stepin.kpopdance/"),
                socialButton(Images.linkedin,
                    "https://kr.linkedin.com/company/sidewalkentertainment"),
              ],
            ))
      ],
    );
  }

  Widget socialButton(String imagePath, String url) {
    return BasicButton(
        tapCallback: () {
          launchUrl(Uri.parse(url));
        },
        child: Image.asset(
          imagePath,
          width: 20.r,
        ));
  }

  Widget eulaLineWidget() {
    return SizedBox(
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                linkButton("eula".tr(), "https://faq.stepin.ai/en/terms/eula"),
                20.horizontalSpace,
                linkButton("operational_policy".tr(),
                    "https://faq.stepin.ai/en/terms/operation"),
                20.horizontalSpace,
                linkButton("privacy_policy".tr(),
                    "https://faq.stepin.ai/en/terms/privacy"),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                linkButton("community_guidlines".tr(),
                    "https://faq.stepin.ai/en/terms/community"),
                20.horizontalSpace,
                linkButton("virtual_goods_policy".tr(),
                    "https://faq.stepin.ai/en/terms/virtualgoods")
              ],
            )
          ],
        ));
  }

  Widget linkButton(String label, String url) {
    return BasicButton(
        tapCallback: () {
          launchUrl(Uri.parse(url));
        },
        child: Container(
            color: Colors.transparent,
            child: TextRenderer(
              text: label,
              child: Text(
                label,
                style: FontTheme.bold.override(
                    color: Colors.white,
                    fontSize: 12.spMin,
                    decoration: TextDecoration.underline),
              ),
            )));
  }

  Widget sidewalkWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "footer_content_01".tr(),
          style: FontTheme.bold.override(
            color: Colors.white,
            fontSize: 8.spMin,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "footer_content_02".tr(),
              textAlign: TextAlign.start,
              style: FontTheme.bold.override(
                color: Colors.white,
                fontSize: 8.spMin,
              ),
            ),
            8.horizontalSpace,
            BasicButton(
              tapCallback: () {
                launchUrl(Uri.parse("mailto:${"email_addir".tr()}"));
              },
              child: Text(
                "email_addir".tr(),
                style: FontTheme.bold.override(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 8.spMin,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
