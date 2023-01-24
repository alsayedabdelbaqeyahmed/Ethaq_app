import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';

class ColumnOfTitleNumber extends StatelessWidget {
  const ColumnOfTitleNumber({
    Key? key,
    required this.title,
    required this.number,
  }) : super(key: key);
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f12,
          ),
        ).tr(),
        const SizedBox(
          height: 5,
        ),
        Text(
          number,
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f12,
          ),
        ),
      ],
    );
  }
}
