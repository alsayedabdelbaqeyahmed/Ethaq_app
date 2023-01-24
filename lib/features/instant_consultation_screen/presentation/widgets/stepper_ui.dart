import 'package:flutter/material.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/utils/app_sizes.dart';

class StepperUI extends StatelessWidget {
  const StepperUI({
    Key? key,
    required this.length,
    this.lineLength = 8,
    required this.currentIndex,
  }) : super(key: key);
  final int length;
  final int lineLength;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              length,
              (index) => Row(
                children: [
                  // number  ====>>>
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.padding6,
                      horizontal: AppPadding.padding12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppBorderRadius.smallRadius,
                      ),
                      border: Border.all(
                        width: 1.2,
                        color: currentIndex >= index
                            ? AppColors.cPrimary
                            : AppColors.cTextSubtitleLight,
                      ),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: currentIndex >= index
                            ? AppColors.cPrimary
                            : AppColors.cTextSubtitleLight,
                        fontSize: AppFontSize.f16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // line ====>>>
                  if (index != length - 1)
                    Text(
                      '-' * lineLength,
                      style: const TextStyle(
                        color: AppColors.cPrimary,
                        fontSize: 14,
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
