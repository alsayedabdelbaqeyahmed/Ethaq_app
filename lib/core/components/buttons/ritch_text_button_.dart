import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/colors.dart';

// TODO: reuse rich text button
class RichTextButton extends StatelessWidget {
  final String? text1;
  final String? text2;
  final VoidCallback? onPressed;

  const RichTextButton({
    Key? key,
    this.text1,
    this.text2,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1!.tr(),
        children: [
          TextSpan(
            text: text2!.tr(),
            style: const TextStyle(
              color: AppColors.cPrimary,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
