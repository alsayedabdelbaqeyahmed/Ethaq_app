import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/cubit/consulting_cubit.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/pages/consulting_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultingScreen extends StatelessWidget {
  const ConsultingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConsultingCubit(),
      child:  BlocConsumer<ConsultingCubit,ConsultingState>(
        listener: (BuildContext context , state){},
        builder: (BuildContext context , state){
          ConsultingCubit cubit = ConsultingCubit.get(context);

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
                  const Expanded(
                    child: TabBarView(
                      children: [
                        // pending tab view ==============>>>>>>
                        ConsultingGrid(
                          type: 'بالإنتظار',
                        ),

                        // under process tab view ==============>>>>>>
                        ConsultingGrid(
                          type: "تحت التنفيذ",
                        ),

                        // ended requests tab view ==============>>>>>>
                        ConsultingGrid(
                          type: "منفذة",
                        ),

                        // cancelled tab view ==============>>>>>>
                        ConsultingGrid(
                          type: "ملغاة",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
