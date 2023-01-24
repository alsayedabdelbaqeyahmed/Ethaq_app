import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../config/themes/colors.dart';

class PinTextFormField extends StatelessWidget {
  const PinTextFormField({
    Key? key,
    required this.textEditingController,
     this.validator,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: 5,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        cursorColor: AppColors.cPrimary,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: Colors.white,
          borderWidth: 1.5,
          selectedColor: AppColors.cPrimary,
          activeColor: AppColors.cPrimary,
          inactiveColor: AppColors.cTextSubtitleLight,
        ),
        validator: validator,
        animationDuration: const Duration(milliseconds: 200),
        // backgroundColor: Colors.white,
        // enableActiveFill: true,
        // errorAnimationController: StreamController<ErrorAnimationType>(),
        controller: textEditingController,
        onCompleted: (otp) {},
        onChanged: (value) {},
        beforeTextPaste: (text) {
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
