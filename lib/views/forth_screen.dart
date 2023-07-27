import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:stepin_website/configurations/constant/constant.dart';
import 'package:stepin_website/configurations/styles/styles.dart';

class ForthScreen extends StatelessWidget {
  const ForthScreen({super.key});

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
                    Images.background4,
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
              width: 1200.spMin,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [leftWidget(), rightWidget()],
              ))
        ],
      ),
    );
  }

  Widget leftWidget() {
    return Positioned(
        left: 0,
        child: Container(
          width: 0.40.sw,
          height: 0.409.sw,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: Image.asset(Images.forthImg01).image)),
        ));
  }

  Widget rightWidget() {
    return Positioned(
        right: 0,
        child: Container(
            width: 555.spMin,
            height: 786.spMin,
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 555.spMin,
                  height: 250.spMin,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(Images.forthImg02).image)),
                ),
                40.verticalSpace,
                SizedBox(
                    width: 456.spMin,
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
            )));
  }
}
