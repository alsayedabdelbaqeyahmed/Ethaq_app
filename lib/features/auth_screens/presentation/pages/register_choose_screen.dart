import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/login/login_screen.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/register/register_as_client.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/register/register_as_lawyer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/components/buttons/rounded_button.dart';
import '../../../../core/utils/app_images.dart';

class RegisterChooseScreen extends StatelessWidget {
  const RegisterChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("create_account").tr(),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            AppImages.chooseSignImage,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: AppPadding.padding12,
              end: AppPadding.padding12,
              bottom: AppPadding.padding32,
            ),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ReusedRoundedButton(
                          text: 'register_as_client',
                          onPressed: () {
                            navigateTo(
                              context,
                              const RegisterAsClientScreen(),
                              pageTransitionType:
                                  PageTransitionType.rightToLeftWithFade,
                            );
                          },
                          rowWidget: const Icon(
                            IconlyBold.user2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppPadding.padding12,
                      ),
                      Expanded(
                        child: ReusedRoundedButton(
                          text: 'register_as_lawyer',
                          onPressed: () {
                            navigateTo(
                              context,
                              const RegisterAsLawyer(),
                              pageTransitionType:
                                  PageTransitionType.leftToRightWithFade,
                            );
                          },
                          rowWidget: const Icon(
                            IconlyBold.bag,
                            color: Colors.white,
                          ),
                          color: AppColors.secondColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.padding8,
                  ),
                  TextButton(
                    onPressed: () {
                      navigateTo(
                        context,
                        const LoginScreen(),
                      );
                    },
                    child: const Text(
                      'already_have_account',
                    ).tr(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
