import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/cubit/instant_consultation_cubit.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/cubit/instant_consultation_state.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/pages/all_lawyers_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../core/components/textformfields/search_textform.dart';
import '../widgets/choose_container.dart';
import '../widgets/search_a_lawyer_selectable.dart';

class StepOneInstantConsultation extends StatelessWidget {
  const StepOneInstantConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstantConsultationCubit, InstantConsultationState>(
      listener: (context, state) {},
      builder: (context, state) {
        final instantConsultationCubit = InstantConsultationCubit.get(context);
        return Column(
          children: [
            // switch is free text ====>>
            Container(
              margin: const EdgeInsetsDirectional.only(
                start: AppPadding.largePadding,
                end: AppPadding.largePadding,
                top: AppPadding.largePadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'for_free'.tr(),
                    style: AppStyles.title600,
                  ),
                  CupertinoSwitch(
                    value: instantConsultationCubit.isFree,
                    onChanged: (value) {
                      instantConsultationCubit.changeIsFree(context);
                    },
                  ),
                ],
              ),
            ),
            // choose offer type ====>>>
            const SizedBox(
              height: AppPadding.largePadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.largePadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ChooseContainer(
                      title: "offer_to_all_lawyers",
                      imageSvg: AppImages.personsSvg,
                      isSelected: instantConsultationCubit.forAllLawyers,
                      onTap: () {
                        instantConsultationCubit.changeForLawyer(true);
                      },
                    ),
                  ),
                  const SizedBox(width: AppPadding.largePadding * 2),
                  Expanded(
                    child: ChooseContainer(
                      title: "choose_one_lawyer",
                      imageSvg: AppImages.personSvg,
                      isSelected: !instantConsultationCubit.forAllLawyers,
                      onTap: () {
                        instantConsultationCubit.changeForLawyer(false);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // bodies ======>>>
            if (instantConsultationCubit.forAllLawyers)
              const AllLawyersBody()
            else
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppPadding.largePadding,
                    ),
                    // Search Bar ======>>>>
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.largePadding,
                        vertical: AppPadding.smallPadding,
                      ),
                      child: SearchTextFormField(
                        searchController:
                            instantConsultationCubit.searchController,
                        hintText: 'search_a_lawyer'.tr(),
                        prefixIcon: const Icon(
                          IconlyLight.search,
                          color: AppColors.cTextSubtitleLight,
                        ),
                        onChanged: (value) {
                          instantConsultationCubit
                              .getDataForConsultation(context);
                        },
                      ),
                    ),

                    // Grid Search ======>>>>
                    if (state is GetDataForConsultationLoadingState)
                      const Expanded(child: LoadingWidget())
                    else
                      instantConsultationCubit.dataForCreateConsultingModel ==
                              null
                          ? const Expanded(child: LoadingWidget())
                          : Expanded(
                              child: instantConsultationCubit
                                      .vendorsList.isEmpty
                                  ? const EmptyBody()
                                  : GridView.builder(
                                      padding: const EdgeInsets.all(
                                        AppPadding.mediumPadding,
                                      ),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 1.1,
                                      ),
                                      itemCount: instantConsultationCubit
                                          .vendorsList.length,
                                      itemBuilder: (context, index) =>
                                          SearchLawyerContainerSelectable(
                                        dataVendor: instantConsultationCubit
                                            .vendorsList[index],
                                        isSelected:
                                            instantConsultationCubit.vendorId ==
                                                instantConsultationCubit
                                                    .vendorsList[index].id,
                                        onTap: () => instantConsultationCubit
                                            .changeVendorId(
                                          instantConsultationCubit
                                              .vendorsList[index].id,
                                        ),
                                      ),
                                      controller: instantConsultationCubit
                                          .scrollController,
                                    ),
                            ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
