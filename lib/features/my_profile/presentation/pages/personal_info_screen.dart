import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/image_avatar/avatar_with_edit.dart';
import '../../../../core/components/textformfields/profile_textformfield.dart';
import '../../../../core/utils/most_used_functions.dart';
import '../cubit/my_profile_cubit.dart';
import '../cubit/my_profile_state.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProfileCubit, MyProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final myProfileCubit = MyProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('personal_information').tr(),
          ),
          body: myProfileCubit.myProfileModel != null
              ? Form(
                  key: myProfileCubit.personalInfoFormKey,
                  child: ListView(
                    padding: const EdgeInsetsDirectional.only(
                      start: AppPadding.largePadding,
                      end: AppPadding.largePadding,
                      top: AppPadding.largePadding,
                    ),
                    children: [
                      // image avatar ===========>>>
                      Center(
                        child: AvatarWithEdit(
                          onTap: () {
                            myProfileCubit.pickProfileImage();
                          },
                          imageFile: myProfileCubit.profileImage,
                          imageUrl: myProfileCubit.myProfileModel!
                                  .dataMyProfile!.userMyProfile!.photo ??
                              '',
                        ),
                      ),
                      const SizedBox(
                        height: AppPadding.padding8,
                      ),

                      // name text form field ===========>>>
                      ProfileTextFormField(
                        labelText: "name_in_arabic_only",
                        hintText: "علي أشرف عبدالحكيم",
                        textEditingController: myProfileCubit.nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name_is_required'.tr();
                          } else if (MostUsedFun().isArabicOnly(value) ==
                              false) {
                            return 'name_must_be_in_arabic'.tr();
                          }
                          return null;
                        },
                      ),

                      // date of birth =======>>>>
                      ProfileTextFormField(
                        labelText: "date_of_birth",
                        hintText: "mm/dd/yy",
                        suffixIcon: Icons.arrow_forward_ios,
                        textEditingController:
                            myProfileCubit.dateOfBirthController,
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        onTap: () async {
                          myProfileCubit.dateOfBirthController.text =
                              await MostUsedFun().showDatePickerDialog(
                            context: context,
                            firstDate: DateTime(1900),
                          );
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'date_of_birth_is_required'.tr();
                          }
                          return null;
                        },
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
                )
              : const ErrorBody(),
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
                if (myProfileCubit.personalInfoFormKey.currentState!
                    .validate()) {
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
