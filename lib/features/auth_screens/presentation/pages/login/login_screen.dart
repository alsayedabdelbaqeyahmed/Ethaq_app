import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_cubit.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_state.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/register_choose_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../core/components/buttons/ritch_text_button_.dart';
import '../../../../../core/components/buttons/rounded_button.dart';
import '../../../../../core/components/textformfields/mobile_textform_with_flag.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../widgets/contact_us_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
       // resizeToAvoidBottomInset: false,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            final loginCubit = LoginCubit.get(context);
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.only(
                  bottom: AppPadding.largePadding,
                  top: AppPadding.largePadding,
                  start: AppPadding.largePadding,
                  end: AppPadding.largePadding,
                ),
                child: Form(
                  key: loginCubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // logo image ===========>>>>
                      Center(
                        child: Image.asset(
                          AppImages.appLogo,
                          fit: BoxFit.contain,
                          width: context.width * 0.6,
                        ),
                      ),
                      const SizedBox(
                        height: AppPadding.padding12,
                      ),

                      // welcome text ========>>>
                      Text(
                        "welcome",
                        style: AppStyles.title600.copyWith(
                          color: AppColors.secondColor,
                        ),
                      ).tr(),

                      // please enter phone number text ========>>>
                      const Text(
                        "please_enter_your_number",
                        style: AppStyles.title800,
                      ).tr(),

                      // sub title text ========>>>
                      const Text(
                        "verify_message",
                        style: AppStyles.subtitle600,
                      ).tr(),

                      // phone number text field ========>>>
                      const SizedBox(
                        height: AppPadding.padding4,
                      ),
                      TextFormWithFlag(
                        textEditingController: loginCubit.phoneNumberController,
                        hintText: "phone_number",
                        suffixIcon: IconlyBold.call,
                        onChanged: (value) {
                          loginCubit.phoneNumber = value.completeNumber;
                        },
                      ),

                      // send code button ========>>>
                      const SizedBox(
                        height: AppPadding.padding4,
                      ),
                      if (state is SendCodeLoadingState)
                        const LoadingWidget()
                      else
                        ReusedRoundedButton(
                          text: "send_code",
                          onPressed: () {
                            if (loginCubit.formKey.currentState!.validate()) {
                              loginCubit.sendLoginSms(context);
                            }
                          },
                        ),

                      // Don't have an account? Sign up text ========>>>
                      const SizedBox(
                        height: AppPadding.padding4,
                      ),
                      Center(
                        child: RichTextButton(
                          text1: "dont_have_an_account",
                          text2: "create_new_account",
                          onPressed: () {
                            navigateTo(context, const RegisterChooseScreen());
                          },
                        ),
                      ),
                    ]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: AppPadding.smallPadding,
                            ),
                            child: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          },
        ),
        bottomSheet: Container(
          height: context.height * 0.1,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: const ContactUsButton(),
        ),
      ),
    );
  }
}
