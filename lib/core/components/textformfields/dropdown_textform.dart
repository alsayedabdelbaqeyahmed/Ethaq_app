import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../config/themes/colors.dart';
import '../../utils/app_sizes.dart';

class ReusedCustomDropdown extends StatefulWidget {
  const ReusedCustomDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    required this.jobRoleCtrl,
    required this.errorText,
    this.onChanged,
  }) : super(key: key);
  final List<String> items;
  final TextEditingController jobRoleCtrl;
  final Function(String)? onChanged;
  final String hintText;
  final String errorText;

  @override
  // ignore: library_private_types_in_public_api
  _ReusedCustomDropdownState createState() => _ReusedCustomDropdownState();
}

class _ReusedCustomDropdownState extends State<ReusedCustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      hintText: "    ${widget.hintText.tr()}",
      items: widget.items.isEmpty ? [''] : widget.items,
      controller: widget.jobRoleCtrl,
      borderRadius: BorderRadius.circular(
        AppBorderRadius.defaultRadius,
      ),
      listItemStyle: const TextStyle(
        fontSize: AppFontSize.f12,
        color: AppColors.cPrimary,
      ),
      hintStyle: TextStyle(
        fontSize: AppFontSize.f12,
        color: Theme.of(context).textTheme.bodyText1!.color,
        fontWeight: FontWeight.w600,
      ),
      selectedStyle: const TextStyle(
        fontSize: AppFontSize.f12,
        color: AppColors.cPrimary,
      ),
      fieldSuffixIcon: Icon(
        Icons.keyboard_arrow_down,
        color: Theme.of(context).textTheme.bodyText1!.color,
      ),
      errorText: widget.errorText.tr(),
      borderSide: BorderSide(
        color: AppColors.cTextSubtitleLight.withOpacity(0.5),
      ),
      onChanged: widget.onChanged,
      errorBorderSide: BorderSide.none,
    );
  }
}
