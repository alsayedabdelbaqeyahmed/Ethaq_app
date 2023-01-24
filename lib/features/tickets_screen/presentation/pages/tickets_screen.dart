import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tickets').tr(),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.mediumPadding),
            decoration: BoxDecoration(
              color: AppColors.cGrayOff.withOpacity(.4),
              borderRadius: BorderRadius.circular(AppBorderRadius.mediumRadius),
            ),
            child: Text('${'you_have'.tr()}0${'ticket'.tr()}'),
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
          onPressed: () {},
          text: 'create_new_ticket',
          rowWidget: const AssetSvgImage(
            AppImages.ticket2Icon,
          ),
        ),
      ),
    );
  }
}
