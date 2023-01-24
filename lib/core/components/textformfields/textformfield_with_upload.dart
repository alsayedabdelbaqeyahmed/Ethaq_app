import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../../../config/themes/colors.dart';
import '../../../config/themes/styles.dart';
import '../../utils/app_sizes.dart';

// text form with suffix icon for upload image
class ReusedTextFormFieldFile extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final bool? obscure;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onFileTap;
  final VoidCallback? onCameraTap;
  final VoidCallback? onGalleryTap;
  final bool? readOnly;
  final GestureTapCallback? onTap;

  const ReusedTextFormFieldFile({
    Key? key,
    this.textEditingController,
    this.keyboardType,
    this.validator,
    this.obscure,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onFileTap,
    this.onGalleryTap,
    this.onCameraTap,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppPadding.smallPadding),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscure ?? false,
        validator: validator,
        readOnly: readOnly ?? false,
        onTap: onTap ?? () {},
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
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: AppColors.secondColor,
                )
              : null,
          suffixIcon: FocusedMenuHolder(
            menuWidth: MediaQuery.of(context).size.width * 0.6,
            blurSize: 0,
            menuItemExtent: 45,
            menuOffset: 8,
            menuBoxDecoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                ),
              ],
            ),
            animateMenuItems: true,
            menuItems: [
              FocusedMenuItem(
                title: Text(
                  'photo_library'.tr(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                trailingIcon: const Icon(
                  IconlyLight.image,
                  color: AppColors.cPrimary,
                ),
                onPressed: onGalleryTap ?? () {},
              ),
              FocusedMenuItem(
                title: Text(
                  'take_photo_video'.tr(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                trailingIcon: const Icon(
                  IconlyLight.camera,
                  color: AppColors.cPrimary,
                ),
                onPressed: onCameraTap ?? () {},
              ),
              FocusedMenuItem(
                title: Text(
                  'choose_file'.tr(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                trailingIcon: const Icon(
                  IconlyLight.document,
                  color: AppColors.cPrimary,
                ),
                onPressed: onFileTap ?? () {},
              ),
            ],
            onPressed: () {},
            openWithTap: true,
            child: Container(
              width: 80,
              height: 55,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding8,
              ),
              decoration: BoxDecoration(
                color: AppColors.cPrimary,
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.radius6,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    IconlyLight.upload,
                    color: AppColors.secondColor,
                  ),
                  FittedBox(
                    child: Text(
                      'choose_file'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppFontSize.f12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
