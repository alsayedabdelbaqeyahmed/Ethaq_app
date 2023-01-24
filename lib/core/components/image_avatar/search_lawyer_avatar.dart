import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../config/themes/styles.dart';

class SearchLawyerAvatar extends StatelessWidget {
  const SearchLawyerAvatar({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            // Image Avatar ======>>>>
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                AppConst.mediaUrl + imageUrl,
              ),
            ),

            // Online Status ======>>>>
            const Padding(
              padding: EdgeInsets.all(AppPadding.padding2),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.cSuccess,
                ),
              ),
            ),
          ],
        ),

        // Name ======>>>>
        const SizedBox(
          height: AppPadding.padding4,
        ),
        Text(
          // first two names only ======>>>>
          '${name.split(' ')[0]} ${name.split(' ')[1]}',
          textAlign: TextAlign.center,
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f10,
          ),
        ),
      ],
    );
  }
}
