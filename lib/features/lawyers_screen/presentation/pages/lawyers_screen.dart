import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/textformfields/dropdown_textform.dart';
import '../../../../core/components/textformfields/search_textform.dart';
import '../../../search_a_lawyer_screen/presentation/widgets/search_lawyer_container.dart';

class LawyerScreen extends StatelessWidget {
  const LawyerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar  =====>>>
      appBar: AppBar(
        title: Text(
          'lawyers'.tr(),
        ),
      ),

      // body ======>>>>
      body: Column(
        children: [
          // Search Bar ======>>>>
          Padding(
            padding: const EdgeInsets.all(AppPadding.largePadding),
            child: SearchTextFormField(
              searchController: TextEditingController(),
              hintText: 'search_a_lawyer'.tr(),
            ),
          ),

          // choose a lawyer and active lawyers ======>>>>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.largePadding),
            child: Row(
              children: [
                // choose a lawyer ======>>>>
                Expanded(
                  child: ReusedCustomDropdown(
                    items: const [""],
                    jobRoleCtrl: TextEditingController(),
                    hintText: 'choose_department',
                    errorText: '',
                  ),
                ),

                // active lawyers ======>>>>
                const SizedBox(
                  width: AppPadding.padding24,
                ),
                Row(
                  children: [
                    Text(
                      "active_now",
                      style: AppStyles.title600.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: AppFontSize.f12,
                      ),
                    ).tr(),
                    CupertinoSwitch(
                      value: true,
                      thumbColor: AppColors.cPrimary,
                      activeColor: AppColors.cSuccess,
                      trackColor: Colors.white,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Grid Search ======>>>>
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.1,
              ),
              itemCount: 7,
              itemBuilder: (context, index) => const SearchLawyerContainer(),
            ),
          ),
        ],
      ),
    );
  }
}
