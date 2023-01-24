import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../config/themes/styles.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    Key? key,
    required this.searchController,
    this.readOnly = false,
    this.hintText='',
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController searchController;
  final bool readOnly;
  final String hintText;
  final GestureTapCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      readOnly: readOnly,
      style: AppStyles.title600.copyWith(
        fontSize: AppFontSize.f12,
      ),
      decoration: InputDecoration(
        hintText: hintText.tr(),
        prefixIcon:prefixIcon ?? const Icon(
          IconlyLight.search,
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(AppPadding.padding8),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.defaultRadius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppBorderRadius.defaultRadius),
          ),
          borderSide: BorderSide(
            color: AppColors.cTextSubtitleLight.withOpacity(0.4),
          ),
        ),
      ),
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
