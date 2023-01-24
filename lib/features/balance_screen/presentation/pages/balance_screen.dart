import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/balance_table.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('show_balance').tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // table of balance =======>>>>
          const BalanceTable(
            titles: [
              ['total_balance', '2500 ر.س'],
              ['available_balance_for_withdraw', '2500 ر.س'],
              ['outstanding_balance', '2500 ر.س'],
            ],
          ),

          // withdraw button =======>>>>
          Container(
            width: context.width * 0.4,
            margin: const EdgeInsets.symmetric(
              horizontal: AppPadding.largePadding,
            ),
            child: ReusedRoundedButton(
              text: "balance_withdrawal",
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: AppPadding.mediumPadding,
          ),

          // withdraw history =======>>>>
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.largePadding,
              vertical: AppPadding.smallPadding,
            ),
            child: Text(
              "financial_transactions",
              style: AppStyles.title600.copyWith(
                fontSize: AppFontSize.f14,
              ),
            ).tr(),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.largePadding,
              ),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.cTextSubtitleLight.withOpacity(0.6),
                );
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title and date =======>>>>
                    Text(
                      "تم تعليق مبلغ مقداره 0.105 للطلب تجربة لأجل التحكيم.",
                      style: AppStyles.title600.copyWith(
                        fontSize: AppFontSize.f12,
                      ),
                    ).tr(),
                    const SizedBox(height: AppPadding.smallPadding),


                    // date & time =======>>>>
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          // date ======>>>
                          Text(
                            "12/12/2021",
                            style: AppStyles.subtitle600.copyWith(
                              fontSize: AppFontSize.f10,
                            ),
                          ),

                          // height divider ======>>>
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.padding2,
                            ),
                            child: Container(
                              color: AppColors.cTextSubtitleLight,
                              width: 1,
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppPadding.padding4,
                              ),
                            ),
                          ),

                          // since =====>>>
                          Text(
                            'منذ 5 دقائق',
                            style: AppStyles.subtitle600.copyWith(
                              fontSize: AppFontSize.f10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppPadding.smallPadding),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
