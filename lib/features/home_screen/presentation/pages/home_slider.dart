import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';

import '../../../lawyers_screen/presentation/pages/lawyers_screen.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // slider =======>>>
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.largePadding,
        vertical: AppPadding.padding16,
      ),
      child: Row(
        children: List.generate(
          3,
          (index) => Container(
            width: context.width * 0.86,
            margin: EdgeInsetsDirectional.only(end: context.width * 0.04),
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.padding8,
              vertical: AppPadding.padding16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.defaultRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Image.asset(
                    AppImages.sliderHomeLawyers,
                    fit: BoxFit.cover,
                    width: 115,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title =====>>>
                    Text(
                      'title_slider_home'.tr(),
                      style: AppStyles.title700.copyWith(
                        height: 2,
                        fontSize: 14,
                      ),
                    ),

                    // show lawyers =====>>>
                    const SizedBox(height: AppPadding.padding8),
                    SizedBox(
                      width: 124,
                      height: 45,
                      child: ReusedRoundedButton(
                        text: "see_lawyers",
                        onPressed: () {
                          navigateTo(context, const LawyerScreen());
                        },
                        fontSize: AppFontSize.f10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
