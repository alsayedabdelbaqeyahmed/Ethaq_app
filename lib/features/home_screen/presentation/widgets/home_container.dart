import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/widgets.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.title,
    required this.color,
    required this.imageSvg,
    this.onTap,
  }) : super(key: key);
  final Color color;
  final String title;
  final String imageSvg;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??() {},
      child: Container(
        padding: const EdgeInsets.all(AppPadding.padding16),
        decoration: BoxDecoration(
          color: color,
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
        child: Column(
          children: [
            AssetSvgImage(
              imageSvg,
              width: 60,
              height: 60,
            ),
            const SizedBox(
              height: AppPadding.padding4,
            ),
            FittedBox(
              child: Text(
                title.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
