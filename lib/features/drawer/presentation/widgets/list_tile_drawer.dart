import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
  }) : super(key: key);
  final String leadingIcon;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.cPrimary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AssetSvgImage(
          leadingIcon,
        ),
      ),
      horizontalTitleGap: 0,
      title: Text(title,style: AppStyles.title500,).tr(),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: onTap ?? () {},
    );
  }
}
