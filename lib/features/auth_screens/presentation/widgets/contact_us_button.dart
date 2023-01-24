import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import 'contact_us_container.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.mediumPadding,
            vertical: AppPadding.padding6,
          ),
          decoration: BoxDecoration(
            color: AppColors.cTextSubtitleLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
            border: Border.all(
              color: AppColors.cTextSubtitleLight,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              OtherHelper().showBottomSheetWithRoundedCorners(
                context,
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: AppPadding.largePadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ContactUsContainer(
                        iconSvgPath: AppImages.messageSvg,
                        url: "",
                        imageColor: AppColors.cSuccess,
                      ),
                      ContactUsContainer(
                        iconSvgPath: AppImages.twitterSvg,
                        url: "",
                      ),
                      ContactUsContainer(
                        iconSvgPath: AppImages.instagramSvg,
                        url: "",
                      ),
                      ContactUsContainer(
                        iconSvgPath: AppImages.facebookSvg,
                        url: "",
                      ),
                      ContactUsContainer(
                        iconSvgPath: AppImages.linkedinSvg,
                        url: "",
                      ),
                    ],
                  ),
                ),
              );
            },
            child: FittedBox(
              child: Row(
                children: [
                  const Text(
                    "contact_us",
                    style: TextStyle(
                      color: AppColors.cGrayOff,
                      fontSize: AppFontSize.f14,
                      fontWeight: FontWeight.w700,
                    ),
                  ).tr(),
                  const SizedBox(
                    width: AppPadding.padding6,
                  ),
                  const AssetSvgImage(
                    AppImages.phoneSvg,
                    color: AppColors.cGrayOff,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
