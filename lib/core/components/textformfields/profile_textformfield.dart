import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/colors.dart';
import '../../utils/app_sizes.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField({
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
    this.isRequired = true,
    this.maxLines = 1,
    this.maxLength,
  }) : super(key: key);
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
  final bool isRequired;
  final int maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label text & required ======>>>
        Row(
          children: [
            Text(
              "$labelText",
              style: AppStyles.title600.copyWith(
                fontSize: AppFontSize.f12,
              ),
            ).tr(),
            // required ===========>>>
            if (isRequired)
              const Text(
                "*",
                style: TextStyle(
                  color: AppColors.cError,
                ),
              ),
          ],
        ),
        const SizedBox(height: AppPadding.padding4),

        // text form field ===========>>>
        TextFormField(
          controller: textEditingController,
          keyboardType: keyboardType,
          obscureText: obscure ?? false,
          readOnly: readOnly ?? false,
          onTap: onTap ?? () {},
          validator: validator,
          maxLines: maxLines,
          maxLength: maxLength,
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f12,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: (hintText ?? '').tr(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.defaultRadius,
              ),
              borderSide: const BorderSide(
                color: AppColors.cPrimary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.defaultRadius,
              ),
              borderSide: BorderSide(
                color: AppColors.cTextSubtitleLight.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppBorderRadius.defaultRadius,
              ),
              borderSide: const BorderSide(
                color: AppColors.cPrimary,
              ),
            ),
            hintStyle: const TextStyle(
              color: AppColors.cTextSubtitleLight,
              fontSize: AppFontSize.f12,
              fontWeight: FontWeight.w600,
            ),
            labelStyle: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: AppFontSize.f12,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppBorderRadius.mediumRadius,
              vertical: AppBorderRadius.smallRadius,
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
                    color: Colors.black,
                    size: 15,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
