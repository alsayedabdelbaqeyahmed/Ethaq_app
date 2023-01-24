import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';

class RowTableText extends StatelessWidget {
  const RowTableText(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2,
      height: AppPadding.padding24,
      margin: const EdgeInsets.symmetric(
        horizontal: AppPadding.mediumPadding,
        vertical: AppPadding.mediumPadding,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text.tr(),
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f12,
            color: AppColors.cPrimary,
          ),
        ).tr(),
      ),
    );
  }
}
