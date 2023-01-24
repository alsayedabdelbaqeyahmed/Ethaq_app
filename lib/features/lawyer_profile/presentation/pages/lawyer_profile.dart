import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/image_avatar/lawyer_profile_avatar.dart';
import '../widgets/column_of_title_number.dart';

class LawyerProfileScreen extends StatelessWidget {
  const LawyerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('personal_profile').tr(),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: AppPadding.largePadding * 2,
          start: AppPadding.largePadding,
          end: AppPadding.largePadding,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            // profile details =====>>>
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(
                top: 60,
                bottom: context.width * 0.6,
              ),
              padding: const EdgeInsetsDirectional.only(
                top: 100,
                start: AppPadding.largePadding,
                end: AppPadding.largePadding,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppBorderRadius.defaultRadius),
                ),
              ),
              child: ListView(
                children: [
                  // number of contracts && consulting =====>>>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // number of contracts =====>>>
                      ColumnOfTitleNumber(
                        title: 'number_of_contracts',
                        number: '200',
                      ),
                      SizedBox(
                        width: AppPadding.largePadding * 2,
                      ),

                      // number of consulting =====>>>
                      ColumnOfTitleNumber(
                        title: 'consulting',
                        number: '2',
                      ),
                    ],
                  ),

                  Divider(
                    color: AppColors.cTextSubtitleLight.withOpacity(0.2),
                    thickness: 1,
                    height: AppPadding.largePadding * 1.5,
                  ),

                  // license number & year of experience & education & specialization =====>>>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // license number & year of experience =====>>>
                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "${'license_number'.tr()}:",
                                style: AppStyles.title600.copyWith(
                                  fontSize: AppFontSize.f12,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' 123456789',
                                    style: AppStyles.subtitle600.copyWith(
                                      fontSize: AppFontSize.f12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "${'years_of_experience'.tr()}:",
                              style: AppStyles.title600.copyWith(
                                fontSize: AppFontSize.f12,
                              ),
                              children: [
                                TextSpan(
                                  text: ' 2',
                                  style: AppStyles.title600.copyWith(
                                    fontSize: AppFontSize.f12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // education =====>>>
                      Text.rich(
                        TextSpan(
                          text: "${'education'.tr()}:",
                          style: AppStyles.title600.copyWith(
                            fontSize: AppFontSize.f12,
                          ),
                          children: [
                            TextSpan(
                              text: '',
                              style: AppStyles.title600.copyWith(
                                fontSize: AppFontSize.f12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // specialization =====>>>
                      Text.rich(
                        TextSpan(
                          text: "${'specialization'.tr()}:",
                          style: AppStyles.title600.copyWith(
                            fontSize: AppFontSize.f12,
                          ),
                          children: [
                            TextSpan(
                              text: '',
                              style: AppStyles.title600.copyWith(
                                fontSize: AppFontSize.f12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: AppPadding.mediumPadding,
                            ),
                            child: e,
                          ),
                        )
                        .toList(),
                  ),

                  // apply & request a consultation =====>>>
                  const SizedBox(
                    height: AppPadding.mediumPadding,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReusedRoundedButton(
                          text: 'apply_request',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: AppPadding.largePadding,
                      ),
                      Expanded(
                        child: ReusedRoundedButton(
                          text: 'request_consultation',
                          color: AppColors.secondColor,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // profile image & name =======>>>
            const LawyerProfileAvatar(),
          ],
        ),
      ),
    );
  }
}
