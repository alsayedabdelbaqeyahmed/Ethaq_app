import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/support_screen/presentation/cubit/support_cubit.dart';
import 'package:ethaqapp/features/support_screen/presentation/cubit/support_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/buttons/rounded_button.dart';
import '../../../../core/components/textformfields/profile_textformfield.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(),
      child: BlocConsumer<SupportCubit, SupportState>(
        listener: (context, state) {},
        builder: (context, state) {
          final supportCubit = SupportCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('support').tr(),
            ),
            body: Form(
              key: supportCubit.supportFormKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.largePadding,
                ),
                children: [
                  // contact us text ======>>>>
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: AppPadding.largePadding,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "contact_us",
                          style: AppStyles.title600,
                        ).tr(),
                        const SizedBox(
                          width: AppPadding.smallPadding,
                        ),
                        const AssetSvgImage(
                          AppImages.phoneSvg,
                          color: AppColors.secondColor,
                        ),
                      ],
                    ),
                  ),

                  // name text form field ===========>>>
                  ProfileTextFormField(
                    labelText: 'name',
                    hintText: 'علي أشرف عبدالحكيم',
                    textEditingController: supportCubit.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'name_is_required'.tr();
                      }
                      return null;
                    },
                  ),

                  // phone text form field ===========>>>
                  ProfileTextFormField(
                    labelText: 'phone_number',
                    hintText: '+966 000 000 000',
                    textEditingController: supportCubit.phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'phone_is_required'.tr();
                      }
                      return null;
                    },
                  ),

                  // email text form field ===========>>>
                  ProfileTextFormField(
                    labelText: 'email_address',
                    hintText: 'ethaq@gmail.com',
                    textEditingController: supportCubit.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email_is_required'.tr();
                      }
                      return null;
                    },
                  ),

                  // message title text form field ===========>>>
                  ProfileTextFormField(
                    labelText: 'message_title',
                    hintText: 'message_title',
                    textEditingController: supportCubit.subjectController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'message_title_is_required'.tr();
                      }
                      return null;
                    },
                  ),

                  // message text form field ===========>>>
                  ProfileTextFormField(
                    labelText: 'message',
                    hintText: 'write_here',
                    maxLines: 3,
                    textEditingController: supportCubit.messegeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'message_is_required'.tr();
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
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsetsDirectional.only(
                start: AppPadding.largePadding,
                end: AppPadding.largePadding,
                bottom: AppPadding.largePadding,
              ),
              child: ReusedRoundedButton(
                text: "send",
                onPressed: () async {
                  await supportCubit.contatctUs(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
