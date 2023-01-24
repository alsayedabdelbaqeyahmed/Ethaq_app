import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/textformfields/search_textform.dart';
import '../../../home_screen/presentation/widgets/see_all_title.dart';
import '../widgets/search_lawyer_container.dart';

class SearchALawyerScreen extends StatelessWidget {
  const SearchALawyerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body ======>>>>
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar ======>>>>
            Padding(
              padding: const EdgeInsets.all(AppPadding.largePadding),
              child: SearchTextFormField(
                searchController: TextEditingController(),
                hintText: 'search_a_lawyer'.tr(),
                prefixIcon: const BackButton(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.cTextSubtitleLight,
                  ),
                ),
              ),
            ),


            // see all lawyers ======>>>>
            SeeAllTitle(
              title: 'lawyers',
              onTap: () {},
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
      ),
    );
  }
}