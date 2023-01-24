import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_images.dart';

class LawyerProfileAvatar extends StatelessWidget {
  const LawyerProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // profile image =====>>>
        Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(AppPadding.largePadding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage(AppImages.sliderHomeLawyers),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: AppColors.secondColor,
              width: 2,
            ),
          ),
        ),
        const SizedBox(
          height: AppPadding.smallPadding,
        ),

        // name =====>>>
        Text(
          'إسم المستخدم',
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f12,
          ),
        ),
      ],
    );
  }
}
