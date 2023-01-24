import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/colors.dart';
import '../../utils/app_sizes.dart';

class ReusedOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? rowWidget;
  final double? fontSize;

  const ReusedOutlinedButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.rowWidget,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(color ?? Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
              side: BorderSide(
                color: color ?? AppColors.cPrimary,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Row(
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
                  color: textColor ?? AppColors.cPrimary,
                  fontSize: fontSize ?? 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
