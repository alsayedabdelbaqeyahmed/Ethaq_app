import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../widgets/notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 20,
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.largePadding,
        ),
        separatorBuilder: (context, index) => Divider(
          height: 20,
          color: AppColors.cTextSubtitleLight.withOpacity(0.5),
        ),
        itemBuilder: (context, index) => const NotificationItem(),
      ),
    );
  }
}
