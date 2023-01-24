import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/my_profile/presentation/pages/personal_info_screen.dart';
import 'package:ethaqapp/features/my_profile/presentation/pages/secure_info_screen.dart';
import 'package:ethaqapp/features/my_profile/presentation/widgets/list_tile_profile.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile').tr(),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(
          start: AppPadding.largePadding,
          end: AppPadding.largePadding,
          top: AppPadding.largePadding,
        ),
        children: [
          // personal info =======>>>>>
          ListTileProfile(
            leadingIcon: AppImages.personSvg2,
            title: "personal_information",
            onTap: () {
              navigateTo(
                context,
                const PersonalInfoScreen(),
              );
            },
          ),

          // security info =======>>>>>
          ListTileProfile(
            leadingIcon: AppImages.securitySafeSvg,
            title: "secure_information",
            onTap: () {
              navigateTo(
                context,
                const SecureInfoScreen(),
              );
            },
          ),
        ]
            .map(
              (e) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: AppPadding.smallPadding,
                ),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
