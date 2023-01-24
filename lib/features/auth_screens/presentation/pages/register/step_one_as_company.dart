import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/textformfields/reused_textformfield.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../core/components/buttons/rounded_button.dart';
import '../../../../../core/components/reuse_functions.dart';

class StepOneAsCompany extends StatelessWidget {
  const StepOneAsCompany({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppPadding.largePadding),
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

          // commercial registration ==============>>>>>>
          const ReusedTextFormField(
            labelText: 'co_registration_number',
            hintText: '500000',
            prefixIcon: IconlyLight.document,
            keyboardType: TextInputType.number,
          ),

          // Expiration of commercial registration ==============>>>>>>
          ReusedTextFormField(
            labelText: 'expiration_of_co_registration',
            hintText: 'mm/dd/yyyy',
            textEditingController: dateController,
            suffixIcon: IconlyLight.calendar,
            keyboardType: TextInputType.number,
            readOnly: true,
            onTap: () {
              // show date picker
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 20),
                ),
              ).then((value) {
                // set date to text form field
                dateController.text = value.toString().substring(0, 10);
              });
            },
          ),

          // next button ==============>>>>>>
          const SizedBox(),
          ReusedRoundedButton(
            text: "next",
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
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
                padding:
                    const EdgeInsets.only(bottom: AppPadding.mediumPadding),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
