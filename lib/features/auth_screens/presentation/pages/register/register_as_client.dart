import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/enums.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../core/components/buttons/rounded_button.dart';
import '../../../../../core/components/textformfields/mobile_textform_with_flag.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../cubit/register/register_cubit.dart';
import '../login/login_screen.dart';

class RegisterAsClientScreen extends StatelessWidget {
  const RegisterAsClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit()
        ..changeAccountType(
          UserType.client.name,
          MembershipType.individual.name,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("register_client").tr(),
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            final registerCubit = RegisterCubit.get(context);
            return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                bottom: AppPadding.largePadding,
                top: AppPadding.largePadding,
                start: AppPadding.largePadding,
                end: AppPadding.largePadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // welcome ==============>>>>>>
                  Text(
                    'welcome_to_ethaq'.tr(),
                    style: AppStyles.title800,
                  ),

                  // description ==============>>>>>>
                  Text(
                    'register_description'.tr(),
                    style: AppStyles.subtitle500,
                  ),

                  // phone number text field ========>>>
                  const SizedBox(
                    height: AppPadding.padding4,
                  ),
                  TextFormWithFlag(
                    textEditingController: registerCubit.phoneController,
                    hintText: "phone_number",
                    suffixIcon: IconlyBold.call,
                    onChanged: (value) {
                      registerCubit.phoneNumber = value.completeNumber;
                    },
                  ),

                  // switch to accept terms and conditions ==============>>>>>>
                  Row(
                    children: [
                      Checkbox(
                        value: registerCubit.isAgreeTerms,
                        activeColor: AppColors.cSuccess,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                        ),
                        onChanged: (value) {
                          registerCubit.changeAgreeTerms();
                        },
                      ),
                      Text(
                        'accept_terms_and_conditions'.tr(),
                        style: AppStyles.subtitle500.copyWith(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ],
                  ),

                  // send code button ========>>>
                  const SizedBox(
                    height: AppPadding.padding4,
                  ),
                  ReusedRoundedButton(
                    text: "send_code",
                    onPressed: () {},
                  ),

                  // Don't have an account? Sign up text ========>>>
                  const SizedBox(
                    height: AppPadding.padding4,
                  ),

                  // already have an account ==============>>>>>>
                  Center(
                    child: TextButton(
                      onPressed: () {
                        navigateAndFinish(
                          context,
                          const LoginScreen(),
                        );
                      },
                      child: const Text(
                        'already_have_account',
                      ).tr(),
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
            );
          },
        ),
      ),
    );
  }
}
