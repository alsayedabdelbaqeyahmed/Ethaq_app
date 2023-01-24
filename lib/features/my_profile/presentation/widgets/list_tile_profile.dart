import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
      ),
      child: ListTile(
        leading: AssetSvgImage(
          leadingIcon,
        ),
        horizontalTitleGap: 0,
        title: Text(
          title,
          style: AppStyles.title500,
        ).tr(),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
        ),
        onTap: onTap ?? () {},
      ),
    );
  }
}
