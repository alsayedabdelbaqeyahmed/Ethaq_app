import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class AllLawyersBody extends StatelessWidget {
  const AllLawyersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.largePadding),
      child: Text(
        "instant_consultation_note",
        style: AppStyles.title600.copyWith(
          fontSize: AppFontSize.f12,
          color: AppColors.secondColor,
        ),
      ).tr(),
    );
  }
}
