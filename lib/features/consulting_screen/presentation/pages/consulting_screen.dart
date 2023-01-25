import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/cubit/consulting_cubit.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/pages/consulting_grid.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/pages/consulting_show_screen.dart';
import 'package:ethaqapp/features/home_screen/presentation/widgets/consulting_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultingScreen extends StatelessWidget {
  const ConsultingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConsultingCubit()..getAllData(context),
      child: BlocConsumer<ConsultingCubit, ConsultingState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          final cubit = ConsultingCubit.get(context);

          if (state is SuccessConsultingState) {
            return DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('consulting').tr(),
                  // tab bar ==============>>>>>>
                  bottom: TabBar(
                    labelColor: AppColors.cPrimary,
                    unselectedLabelColor: AppColors.cPrimary.withOpacity(0.5),
                    indicatorColor: AppColors.cPrimary,
                    isScrollable: true,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: AppColors.cPrimary,
                        width: 2,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      /*Tab(
                      text: 'under_process'.tr(),
                    ),*/
                      // pending tab ==============>>>>>>
                      Tab(
                        text: 'pending'.tr(),
                      ),

                      // under process tab ==============>>>>>>
                      Tab(
                        text: 'under_process'.tr(),
                      ),

                      // ended requests tab ==============>>>>>>
                      Tab(
                        text: 'completed_requests'.tr(),
                      ),

                      // cancelled requests tab ==============>>>>>>
                      Tab(
                        text: 'cancelled_requests'.tr(),
                      ),
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    // divider ==============>>>>>>
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: AppColors.cTextSubtitleLight.withOpacity(0.2),
                    ),

                    // tab bar view ==============>>>>>>
                    Expanded(
                      child: TabBarView(
                        children: [
                          // pending tab view ==============>>>>>>
                          ConsultingGrid(
                            type: 'بالإنتظار',
                            consultingModel: cubit.pendingConsultingModel,
                          ),

                          // under process tab view ==============>>>>>>
                          ConsultingGrid(
                            type: 'تحت التنفيذ',
                            consultingModel: cubit.activeConsultingModel,
                          ),

                          // ended requests tab view ==============>>>>>>
                          ConsultingGrid(
                            type: "منفذة",
                            consultingModel: cubit.doneConsultingModel,
                          ),

                          // cancelled tab view ==============>>>>>>
                          ConsultingGrid(
                            type: "ملغاة",
                            consultingModel: cubit.cancelConsultingModel,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is LoadingConsultingState) {
            return DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('consulting').tr(),
                  // tab bar ==============>>>>>>
                  bottom: TabBar(
                    labelColor: AppColors.cPrimary,
                    unselectedLabelColor: AppColors.cPrimary.withOpacity(0.5),
                    indicatorColor: AppColors.cPrimary,
                    isScrollable: true,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: AppColors.cPrimary,
                        width: 2,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      /*Tab(
                      text: 'under_process'.tr(),
                    ),*/
                      // pending tab ==============>>>>>>
                      Tab(
                        text: 'pending'.tr(),
                      ),

                      // under process tab ==============>>>>>>
                      Tab(
                        text: 'under_process'.tr(),
                      ),

                      // ended requests tab ==============>>>>>>
                      Tab(
                        text: 'completed_requests'.tr(),
                      ),

                      // cancelled requests tab ==============>>>>>>
                      Tab(
                        text: 'cancelled_requests'.tr(),
                      ),
                    ],
                  ),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('There is an error'),
            );
          }
        },
      ),
    );
  }
}
