import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/register/company_tab_view.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/register/lawyer_tab_view.dart';
import 'package:flutter/material.dart';
import '../../../../../config/themes/colors.dart';

class RegisterAsLawyer extends StatelessWidget {
  const RegisterAsLawyer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('lawyer_register').tr(),
          // tab bar ==============>>>>>>
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'lawyer'.tr(),
              ),
              Tab(
                text: 'company'.tr(),
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
                  LawyerTabView(),
                  CompanyTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
