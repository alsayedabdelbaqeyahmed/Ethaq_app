import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/colors.dart';
import '../../../config/themes/styles.dart';
import '../../utils/app_sizes.dart';

class ReusedTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final bool? obscure;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? readOnly;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppPadding.smallPadding),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscure ?? false,
        readOnly: readOnly ?? false,
        onTap: onTap ?? () {},
        validator: validator,
        style: AppStyles.title600.copyWith(
          fontSize: AppFontSize.f12,
        ),
        decoration: InputDecoration(
          hintText: (hintText ?? '').tr(),
          labelText: (labelText ?? '').tr(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.radius6,
            ),
            borderSide: const BorderSide(
              color: AppColors.cPrimary,
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
            color: AppColors.cTextSubtitleLight,
            fontSize: AppFontSize.f12,
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: AppFontSize.f12,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppBorderRadius.mediumRadius,
            vertical: AppBorderRadius.mediumRadius,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: AppColors.secondColor,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: AppColors.secondColor,
                )
              : null,
        ),
      ),
    );
  }

  const ReusedTextFormField({
    Key? key,
    this.textEditingController,
    this.keyboardType,
    this.validator,
    this.obscure,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.onTap,
  }) : super(key: key);
}
