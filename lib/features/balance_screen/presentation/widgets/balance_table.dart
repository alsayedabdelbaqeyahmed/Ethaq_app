import 'package:ethaqapp/features/balance_screen/presentation/widgets/balance_row_table.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/utils/app_sizes.dart';

class BalanceTable extends StatelessWidget {
  const BalanceTable({
    Key? key,
    required this.titles,
  }) : super(key: key);
  final List<List<String>> titles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.largePadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppBorderRadius.mediumRadius),
        child: ListView.separated(
          itemCount: titles.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
            height: 0,
            color: AppColors.cTextSubtitleLight,
          ),
          itemBuilder: (context, index) => BalanceRowTable(
            title: titles[index][0],
            balance: titles[index][1],
            isLast: index == titles.length - 1,
          ),
        ),
      ),
    );
  }
}
