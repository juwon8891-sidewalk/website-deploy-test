import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';
import 'package:stepin_website/views/footer.dart';
import 'package:stepin_website/widget/basic_button.dart';
import 'package:url_launcher/url_launcher.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.37.sh,
      color: Palette.primaryColor01,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 1.sw,
            height: 1.37.sh,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(
                    Images.background5,
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(top: 0, child: fifthWidget()),
          Positioned(top: 1.sh, child: const Footer())
        ],
      ),
    );
  }

  Widget fifthWidget() {
    return SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageRenderer(
                alt: Alts.altList[Images.stepinIcon] ?? "",
                child: Image.asset(
                  Images.stepinIcon,
                  height: 160.h,
                )),
            60.verticalSpace,
            ImageRenderer(
                alt: Alts.altList[Images.fifthImg01] ?? "",
                child: Image.asset(
                  Images.fifthImg01,
                  width: 0.51.sw,
                )),
            105.verticalSpace,
            CTAWidget()
          ],
        ));
  }

  Widget CTAWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
