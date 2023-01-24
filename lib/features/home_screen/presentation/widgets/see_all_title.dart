import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class SeeAllTitle extends StatelessWidget {
  const SeeAllTitle({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.largePadding,
      ),
      child: Row(
        children: [
          Text(
            title.tr(),
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f14,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Text(
              'see_all'.tr(),
              style: AppStyles.title600.copyWith(
                color: AppColors.cPrimary,
                fontSize: AppFontSize.f12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
