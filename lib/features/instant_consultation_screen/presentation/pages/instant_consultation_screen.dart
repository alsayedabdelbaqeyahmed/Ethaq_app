import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/cubit/instant_consultation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/buttons/rounded_button.dart';
import '../../../../core/utils/app_sizes.dart';
import '../cubit/instant_consultation_state.dart';
import '../widgets/stepper_ui.dart';

class InstantConsultationScreen extends StatelessWidget {
  const InstantConsultationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InstantConsultationCubit()
        ..getDataForConsultation(context)
        ..onScrollToEnd(context),
      child: BlocConsumer<InstantConsultationCubit, InstantConsultationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final instantConsultationCubit =
              InstantConsultationCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('instant_consultation').tr(),
            ),
            body: Column(
              children: [
                // stepper ====>>
                Container(
                  margin: const EdgeInsetsDirectional.only(
                    top: AppPadding.largePadding,
                    bottom: AppPadding.smallPadding,
                  ),
                  child: StepperUI(
                    length: instantConsultationCubit.steps.length,
                    lineLength: 12,
                    currentIndex: instantConsultationCubit.currentStep,
                  ),
                ),

                // page view ====>>
                Expanded(
                  child: PageView.builder(
                    itemCount: instantConsultationCubit.steps.length,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: instantConsultationCubit.pageController,
                    itemBuilder: (context, index) =>
                        instantConsultationCubit.steps[index],
                  ),
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
                text:
                    instantConsultationCubit.currentStep == 0 ? "next" : "post",
                onPressed: () {
                  instantConsultationCubit.nextStep(context);
                },
                isLoading: state is CreateConsultationLoadingState,
              ),
            ),
          );
        },
      ),
    );
  }
}
