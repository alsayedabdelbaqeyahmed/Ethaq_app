import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_sizes.dart';

class ContactUsContainer extends StatelessWidget {
  const ContactUsContainer({
    Key? key,
    required this.iconSvgPath,
    required this.url,
    this.imageColor,
  }) : super(key: key);
  final String iconSvgPath;
  final String url;
  final Color? imageColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.cPrimary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
        ),
        child: AssetSvgImage(
          iconSvgPath,
          height: 28,
          width: 28,
          color: imageColor ?? const Color(0xff484848),
        ),
      ),
    );
  }
}
