import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/image_avatar/search_lawyer_avatar.dart';
import '../../../lawyer_profile/presentation/pages/lawyer_profile.dart';
import '../../data/models/data_for_create_consulting_model.dart';

class SearchLawyerContainerSelectable extends StatelessWidget {
  const SearchLawyerContainerSelectable({
    Key? key,
    required this.dataVendor,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final DataVendor dataVendor;
  final bool isSelected;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 190,
            padding: const EdgeInsets.all(AppPadding.padding10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                AppBorderRadius.defaultRadius,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(
                    0,
                    3,
                  ), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image Avatar && online status & Name ======>>>>
                SearchLawyerAvatar(
                  imageUrl: dataVendor.photo ?? '',
                  name: dataVendor.name ?? '',
                ),

                // Text Button with Forward Icon ======>>>>
                InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      const LawyerProfileScreen(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'profile',
                        style: TextStyle(
                          color: AppColors.cPrimary,
                          fontSize: AppFontSize.f10,
                        ),
                      ).tr(),
                      const SizedBox(
                        width: AppPadding.padding4,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.cPrimary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // select button ======>>>>
          Checkbox(
            value: isSelected,
            side: const BorderSide(
              width: 1.2,
            ),
            onChanged: (value) {
              onTap();
            },
          ),
        ],
      ),
    );
  }
}
