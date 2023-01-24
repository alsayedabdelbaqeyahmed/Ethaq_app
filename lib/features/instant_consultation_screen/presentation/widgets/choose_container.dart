import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/components/widgets.dart';

class ChooseContainer extends StatelessWidget {
  const ChooseContainer({
    Key? key,
    required this.title,
    required this.imageSvg,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  final String imageSvg;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: AnimatedContainer(
        padding: const EdgeInsets.all(AppPadding.padding16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cPrimary : Colors.white,
          borderRadius: BorderRadius.circular(
            AppBorderRadius.defaultRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
            ),
          ],
        ),
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            AssetSvgImage(
              imageSvg,
              width: 40,
              height: 40,
              color: isSelected ? Colors.white : AppColors.cPrimary,
            ),
            const SizedBox(
              height: AppPadding.padding4,
            ),
            Text(
              title.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.cPrimary,
                fontSize: AppFontSize.f12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
