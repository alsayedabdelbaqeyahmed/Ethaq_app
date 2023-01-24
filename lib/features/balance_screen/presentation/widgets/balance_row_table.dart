import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class BalanceRowTable extends StatelessWidget {
  const BalanceRowTable({
    Key? key,
    this.isLast = false,
    required this.title,
    required this.balance,
  }) : super(key: key);
  final bool isLast;
  final String balance;
  final String title;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              decoration: BoxDecoration(
                color: AppColors.cPrimary.withOpacity(0.3),
                borderRadius: isLast
                    ? const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(
                          AppBorderRadius.mediumRadius,
                        ),
                      )
                    : null,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.title500,
              ).tr(),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: isLast
                    ? const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(
                          AppBorderRadius.mediumRadius,
                        ),
                      )
                    : null,
              ),
              child: Text(
                balance,
                textAlign: TextAlign.center,
                style: AppStyles.title600.copyWith(
                  color: AppColors.cPrimary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
