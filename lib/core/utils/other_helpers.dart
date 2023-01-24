import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class OtherHelper {
  // show success message =======>>>>
  void showTopSuccessToast(
    BuildContext context,
    String message,
  ) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.success(
        message: message.tr(),
      ),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  // show Fail message =======>>>>
  void showTopFailToast(
    BuildContext context,
    String message,
  ) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(
        message: message.tr(),
      ),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  // show Info message =======>>>>
  void showTopInfoToast(
    BuildContext context,
    String message,
  ) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.info(
        message: message.tr(),
        backgroundColor: AppColors.secondColor,
      ),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  // show bottom sheet with rounded corners =======>>>>
  void showBottomSheetWithRoundedCorners(
    BuildContext context,
    Widget child,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: context.height * 0.2,
      ),
      builder: (context) => Container(
        width: context.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorderRadius.defaultRadius),
            topRight: Radius.circular(AppBorderRadius.defaultRadius),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppPadding.smallPadding),
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // close bottom sheet button =======>>>>
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),

            child,
          ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

//
}
