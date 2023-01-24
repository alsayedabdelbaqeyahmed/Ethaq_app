import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/features/requests_screen/presentation/pages/requests_grid.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('requests').tr(),
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
              // available requests tab ==============>>>>>>
              Tab(
                text: 'available_requests'.tr(),
              ),

              // under process requests tab ==============>>>>>>
              Tab(
                text: 'under_process'.tr(),
              ),

              // ended requests tab ==============>>>>>>
              Tab(
                text: 'completed_requests'.tr(),
              ),

              // arbitration requests tab ==============>>>>>>
              Tab(
                text: 'arbitration_requests'.tr(),
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
                  // available requests tab view ==============>>>>>>
                  RequestsGrid(
                    type: 'متاح',
                  ),

                  // pending requests tab view ==============>>>>>>
                  RequestsGrid(
                    type: "تحت التنفيذ",
                  ),

                  // ended requests tab view ==============>>>>>>
                  RequestsGrid(
                    type: "منفذ",
                  ),

                  // arbitration requests tab view ==============>>>>>>
                  RequestsGrid(
                    type: "التحكيم",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
