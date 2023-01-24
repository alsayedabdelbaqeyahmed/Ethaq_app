import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/features/notifications_screen/presentation/pages/notification_list.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('notifications').tr(),
          // tab bar ==============>>>>>>
          bottom: TabBar(
            labelColor: AppColors.cPrimary,
            unselectedLabelColor: AppColors.cPrimary.withOpacity(0.5),
            indicatorColor: AppColors.cPrimary,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                color: AppColors.cPrimary,
                width: 2,
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: 'accepted_offers'.tr(),
              ),
              Tab(
                text: 'all'.tr(),
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
                  NotificationsList(),
                  NotificationsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
