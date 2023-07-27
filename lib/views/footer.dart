import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/widget/basic_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.37.sh,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          lineWidget(),
          Container(
              width: 0.58.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconLineWidget(),
                  80.verticalSpace,
                  eulaLineWidget(),
                  20.verticalSpace,
                  sidewalkWidget(),
                  8.verticalSpace,
                ],
              ))
        ],
      ),
    );
  }

  Widget lineWidget() {
    return Positioned(
        top: 0,
        child: Container(
          width: 1.sw,
          height: 1.r,
          color: Colors.white.withOpacity(0.2),
        ));
  }

  Widget iconLineWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            ImageRenderer(
                alt: Alts.altList[Images.BI] ?? "",
                child: Image.asset(
                  Images.BI,
                  height: 40.r,
                )),
            20.horizontalSpace,
            Text(
              "X",
              style: FontTheme.bold.override(
                color: Colors.white.withOpacity(0.2),
                fontSize: 32.spMin,
              ),
            ),
            BasicButton(
                tapCallback: () {
                  launchUrl(Uri.parse("https://sidewalkplay.com"));
                },
                child: ImageRenderer(
                    alt: Alts.altList[Images.CI] ?? "",
                    child: Image.asset(
                      Images.CI,
                      height: 40.r,
                    ))),
          ],
        ),
        97.horizontalSpace,
        SizedBox(
            width: 0.2.sw,
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
        child: Image.asset(imagePath, height: 40.r));
  }

  Widget eulaLineWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        linkButton("eula".tr(), "https://faq.stepin.ai/en/terms/eula"),
        40.horizontalSpace,
        linkButton("operational_policy".tr(),
            "https://faq.stepin.ai/en/terms/operation"),
        40.horizontalSpace,
        linkButton(
            "privacy_policy".tr(), "https://faq.stepin.ai/en/terms/privacy"),
        40.horizontalSpace,
        linkButton("community_guidlines".tr(),
            "https://faq.stepin.ai/en/terms/community"),
        40.horizontalSpace,
        linkButton("virtual_goods_policy".tr(),
            "https://faq.stepin.ai/en/terms/virtualgoods")
      ],
    );
  }

  Widget linkButton(String label, String url) {
    return BasicButton(
        tapCallback: () {
          launchUrl(Uri.parse(url));
        },
        child: TextRenderer(
          text: label,
          child: Text(
            label,
            style: FontTheme.bold.override(
                color: Colors.white,
                fontSize: 16.spMin,
                decoration: TextDecoration.underline),
          ),
        ));
  }

  Widget sidewalkWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "footer_content_01".tr(),
          style: FontTheme.bold.override(
            color: Colors.white,
            fontSize: 16.spMin,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "footer_content_02".tr(),
              textAlign: TextAlign.start,
              style: FontTheme.bold.override(
                color: Colors.white,
                fontSize: 16.spMin,
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
                  fontSize: 16.spMin,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
