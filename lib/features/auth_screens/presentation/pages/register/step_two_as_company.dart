import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/textformfields/reused_textformfield.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../core/components/buttons/rounded_button.dart';
import '../../../../../core/components/reuse_functions.dart';
import '../../../../../core/components/textformfields/mobile_textform_with_flag.dart';
import '../../../../../core/components/textformfields/textformfield_with_upload.dart';

class StepTwoAsCompany extends StatelessWidget {
  const StepTwoAsCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppPadding.largePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // License Number ==============>>>>>>
          const ReusedTextFormField(
            labelText: 'license_number',
            hintText: '500000',
            prefixIcon: IconlyLight.document,
            keyboardType: TextInputType.number,
          ),

          // license image ==============>>>>>>
          ReusedTextFormFieldFile(
            labelText: 'license',
            hintText: 'upload_license',
            suffixIcon: IconlyLight.upload,
            keyboardType: TextInputType.number,
            onFileTap: () {},
          ),

          // expire date ==============>>>>>>
          ReusedTextFormField(
            labelText: 'expire_date',
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

          // phone number ==============>>>>>>
          Container(
            margin: const EdgeInsets.only(top: AppPadding.smallPadding),
            child: TextFormWithFlag(
              textEditingController: TextEditingController(),
              hintText: "phone_number",
              suffixIcon: IconlyBold.call,
              onChanged: (value) {
                //authCubit.phoneNumber = value.completeNumber;
              },
            ),
          ),

          // switch to accept terms and conditions ==============>>>>>>
          Row(
            children: [
              Checkbox(
                value: false,
                activeColor: AppColors.cSuccess,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).textTheme.bodyText1!.color!,
                  ),
                ),
                onChanged: (value) {},
              ),
              Text(
                'accept_terms_and_conditions'.tr(),
                style: AppStyles.subtitle500.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ],
          ),

          // save button ==============>>>>>>
          ReusedRoundedButton(
            text: "save",
            onPressed: () {
              // navigateTo(context, const VerificationCodeScreen());
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
