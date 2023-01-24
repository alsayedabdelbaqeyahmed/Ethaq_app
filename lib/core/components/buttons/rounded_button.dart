import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/colors.dart';
import '../../utils/app_sizes.dart';

class ReusedRoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? rowWidget;
  final double? fontSize;
  final bool isLoading;

  const ReusedRoundedButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.rowWidget,
    this.fontSize,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ButtonStyle(
            // elevation: MaterialStateProperty.all(0),
            overlayColor:
                MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
            alignment: Alignment.center,
            backgroundColor:
                MaterialStateProperty.all(color ?? AppColors.cPrimary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
              ),
            ),
          ),
          onPressed: isLoading ? () {} : onPressed,
          child: FittedBox(
            child: isLoading
                ? const LoadingWidget(
                    color: Colors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (rowWidget != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4),
                          child: rowWidget,
                        ),
                      Text(
                        text.tr().toUpperCase(),
                        style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize ?? AppFontSize.f14,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
