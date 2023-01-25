import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/components/textformfields/dropdown_textform.dart';
import 'package:ethaqapp/core/components/textformfields/profile_textformfield.dart';
import 'package:ethaqapp/core/components/textformfields/search_textform.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class NewTicketsScreen extends StatelessWidget {
  const NewTicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('create_ticket').tr(),
      ),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: AppPadding.largePadding),
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: AppPadding.largePadding),
            child: const Text(
              "Ticket address",
              style: AppStyles.title600,
            ).tr(),
          ),
          ProfileTextFormField(
            labelText: '',
            hintText: 'عنوان التذكرة',
            textEditingController: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {
                return 'name_is_required'.tr();
              }
              return null;
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: AppPadding.largePadding),
            child: const Text(
              "Choose Type",
              style: AppStyles.title600,
            ).tr(),
          ),
          Expanded(
            child: ReusedCustomDropdown(
              items: const [""],
              jobRoleCtrl: TextEditingController(),
              hintText: 'Choose Type',
              errorText: '',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: AppPadding.largePadding),
            child: const Text(
              "description",
              style: AppStyles.title600,
            ).tr(),
          ),
          ProfileTextFormField(
            labelText: '',
            hintText: 'write_here',
            maxLines: 3,
            textEditingController: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {
                return 'description_is_required'.tr();
              }
              return null;
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsetsDirectional.only(
          start: AppPadding.largePadding,
          end: AppPadding.largePadding,
          bottom: AppPadding.largePadding,
        ),
        child: ReusedRoundedButton(
          onPressed: () {},
          text: 'create_new_ticket',
          rowWidget: const AssetSvgImage(
            AppImages.vector,
          ),
        ),
      ),
    );
  }
}
