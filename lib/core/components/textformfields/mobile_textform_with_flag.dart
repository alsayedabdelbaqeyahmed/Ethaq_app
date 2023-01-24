import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../config/themes/colors.dart';
import '../../../config/themes/styles.dart';

class TextFormWithFlag extends StatelessWidget {
  const TextFormWithFlag({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.onChanged,
    required this.suffixIcon,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String hintText;
  final ValueChanged onChanged;
  final IconData suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius6),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntlPhoneField(
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f12,
          ),
          initialCountryCode: AppConst.countryCode,
          //textAlign: TextAlign.start,
          controller: textEditingController,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: "50000000",
            suffixIcon: Icon(suffixIcon, color: AppColors.secondColor,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.radius6,
              ),
              borderSide: const BorderSide(
                color: AppColors.cTextSubtitleLight,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.radius6,
              ),
              borderSide: BorderSide(
                color: AppColors.cTextSubtitleLight.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.radius6,
              ),
              borderSide: const BorderSide(
                color: AppColors.cPrimary,
              ),
            ),
            hintStyle: const TextStyle(
              fontSize: AppFontSize.f14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.mediumPadding,
              vertical: AppPadding.mediumPadding,
            ),
          ),
          invalidNumberMessage: "رقم غير صالح",
          onChanged: onChanged,
          // TODO
          disableLengthCheck: true,
          onCountryChanged: (country) {
            debugPrint('Country changed to: ${country.code}');
          },
        ),
      ),
    );
  }
}
