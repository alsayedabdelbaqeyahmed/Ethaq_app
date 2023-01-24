import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/cubit/instant_consultation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/textformfields/dropdown_textform.dart';
import '../../../../core/components/textformfields/profile_textformfield.dart';
import '../cubit/instant_consultation_cubit.dart';

class StepTwoInstantConsultation extends StatelessWidget {
  const StepTwoInstantConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstantConsultationCubit, InstantConsultationState>(
      listener: (context, state) {},
      builder: (context, state) {
        final instantConsultationCubit = InstantConsultationCubit.get(context);
        return state is GetDataForConsultationLoadingState
            ? const LoadingWidget()
            : instantConsultationCubit.dataForCreateConsultingModel == null
                ? const ErrorBody()
                : ListView(
                  padding: const EdgeInsets.all(AppPadding.largePadding),
                  children: [
                    // choose department textform ===>>>
                    ReusedCustomDropdown(
                      items: instantConsultationCubit.departments
                          .map(
                            (e) => e.name ?? '',
                          )
                          .toList(),
                      jobRoleCtrl:
                          instantConsultationCubit.departmentController,
                      hintText: 'choose_department',
                      errorText: '',
                      onChanged: (value) {
                        instantConsultationCubit.departmentId =
                            instantConsultationCubit.departments
                                    .firstWhere(
                                      (element) => element.name == value,
                                    )
                                    .id ??
                                0;
                      },
                    ),
                    const SizedBox(height: AppPadding.largePadding),

                    // request details textform ===>>>
                    ProfileTextFormField(
                      isRequired: false,
                      labelText: "request_details",
                      hintText: "request_details",
                      maxLines: 5,
                      maxLength: 5000,
                      textEditingController:
                          instantConsultationCubit.detailsController,
                    ),

                    // attach file button ===>>>
                    const SizedBox(height: AppPadding.largePadding),
                    Row(
                      children: [
                        Expanded(
                          child: ReusedRoundedButton(
                            text: "attach_files",
                            rowWidget: const Icon(
                              Icons.attachment,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              instantConsultationCubit.pickFiles();
                            },
                          ),
                        ),
                        const SizedBox(width: AppPadding.largePadding),
                        Expanded(
                          child: ReusedOutlinedButton(
                            text:  "voice_message",
                            rowWidget: const Icon(
                              Icons.mic,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: context.width * 0.2),
                      ],
                    ),
                  ],
                );
      },
    );
  }
}
