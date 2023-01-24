import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_functions.dart';
import 'package:ethaqapp/features/my_profile/presentation/cubit/my_profile_cubit.dart';
import 'package:ethaqapp/features/my_profile/presentation/cubit/my_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/textformfields/profile_textformfield.dart';

class SecureInfoScreen extends StatelessWidget {
  const SecureInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProfileCubit, MyProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final myProfileCubit = MyProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('secure_information').tr(),
          ),
          body: Form(
            key: myProfileCubit.secureInfoFormKey,
            child: ListView(
              padding: const EdgeInsetsDirectional.only(
                start: AppPadding.largePadding,
                end: AppPadding.largePadding,
                top: AppPadding.largePadding,
              ),
              children: [
                // email =======>>>>
                ProfileTextFormField(
                  labelText: "email_address",
                  hintText: "ethaq@ethaq.com",
                  textEditingController: myProfileCubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  isRequired: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return null;
                    } else if (!MostUsedFun().isEmail(value)) {
                      return "email_is_invalid".tr();
                    }
                    return null;
                  },
                ),

                // phone number =======>>>>
                Row(
                  children: [
                    Expanded(
                      child: ProfileTextFormField(
                        labelText: "phone_number",
                        hintText: "11158923294896",
                        textEditingController: myProfileCubit.phoneController,
                        readOnly: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "phone_number_required".tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: AppPadding.largePadding,
                    ),
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                  ],
                ),

                // expire of identity & id number =======>>>>
                Row(
                  children: [
                    Expanded(
                      child: ProfileTextFormField(
                        labelText: "identity_number",
                        hintText: "5846219322",
                        textEditingController:
                            myProfileCubit.identityNumberController,
                        keyboardType: TextInputType.number,
                        readOnly: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "identity_number_is_required".tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: AppPadding.largePadding,
                    ),
                    Expanded(
                      child: ProfileTextFormField(
                        labelText: "expire_of_identity",
                        hintText: "dd/mm/yyyy",
                        suffixIcon: Icons.arrow_forward_ios,
                        textEditingController:
                            myProfileCubit.identityExpiryDateController,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),

                // iban certificate =======>>>>
                ProfileTextFormField(
                  labelText: "iban",
                  hintText: "",
                  textEditingController: myProfileCubit.ibanController,
                  isRequired: false,
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
          bottomNavigationBar: Container(
            margin: const EdgeInsetsDirectional.only(
              start: AppPadding.largePadding,
              end: AppPadding.largePadding,
              bottom: AppPadding.largePadding,
            ),
            child: ReusedRoundedButton(
              text: "save",
              color: AppColors.cPrimary.withOpacity(0.5),
              onPressed: () {
                if (myProfileCubit.secureInfoFormKey.currentState!.validate()) {
                  myProfileCubit.updateProfile(context);
                }
              },
              isLoading: state is UpdateProfileLoadingState,
            ),
          ),
        );
      },
    );
  }
}
