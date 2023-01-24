import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_cubit.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/textformfields/pin_textformfield.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            final loginCubit = LoginCubit.get(context);
            return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                bottom: AppPadding.largePadding,
                top: AppPadding.largePadding,
                start: AppPadding.largePadding,
                end: AppPadding.largePadding,
              ),
              child: Column(
                children: [
                  // verification code text ========>>>
                  Text(
                    "verify_code",
                    style: AppStyles.title800.copyWith(
                      fontSize: AppFontSize.f18,
                    ),
                  ).tr(),
                  const SizedBox(
                    height: AppPadding.padding12,
                  ),

                  // sub title text ========>>>
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "check_your_phone".tr(),
                      style: AppStyles.subtitle500.copyWith(
                        fontSize: AppFontSize.f14,
                      ),
                      children: [
                        TextSpan(
                          text: phoneNumber,
                          style: AppStyles.subtitle500.copyWith(
                            fontSize: AppFontSize.f14,
                            color: AppColors.cPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppPadding.padding12,
                  ),

                  // pin text form field ========>>>
                  const SizedBox(
                    height: AppPadding.padding4,
                  ),
                  PinTextFormField(
                    textEditingController: loginCubit.otpController,
                  ),

                  // resend code text ========>>>
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text.rich(
                      TextSpan(
                        text: "resend".tr(),
                        style: AppStyles.subtitle500,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        children: [
                          TextSpan(
                            text: "60ث".tr(),
                            style: AppStyles.title800.copyWith(
                              color: Colors.black,
                              fontSize: AppFontSize.f14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // login button ========>>>
                  const SizedBox(
                    height: AppPadding.padding24,
                  ),
                  if (state is VerifyLoadingState)
                    const LoadingWidget()
                  else
                    ReusedRoundedButton(
                      text: "login",
                      onPressed: () {
                        if (loginCubit.otpController.text.length == 5) {
                          loginCubit.verifyLoginSms(context, phoneNumber);
                        } else {
                          OtherHelper().showTopInfoToast(context, "enter_otp");
                        }
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
