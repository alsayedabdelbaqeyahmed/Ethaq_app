import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.smallPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar =====>>>
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.logoWithoutText),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: AppPadding.padding12),

          // title =====>>>
          Expanded(
            child: Column(
              children: [
                Text(
                  "تم تسليم أعمال الطلب تجربة لتحكيم محامي محامي تجربة",
                  style: AppStyles.title600.copyWith(
                    fontSize: AppFontSize.f12,
                  ),
                ).tr(),
                const SizedBox(height: AppPadding.padding10),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Icon(
                        IconlyBold.timeCircle,
                        size: 15,
                        color: AppColors.cTextSubtitleLight,
                      ),
                      const SizedBox(
                        width: AppPadding.padding4,
                      ),

                      // date ======>>>
                      Text(
                        "12/12/2021",
                        style: AppStyles.subtitle600.copyWith(
                          fontSize: AppFontSize.f10,
                        ),
                      ),

                      // height divider ======>>>
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.padding2,
                        ),
                        child: Container(
                          color: AppColors.cTextSubtitleLight,
                          width: 1,
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppPadding.padding4,
                          ),
                        ),
                      ),

                      // since =====>>>
                      Text(
                        'منذ 5 دقائق',
                        style: AppStyles.subtitle600.copyWith(
                          fontSize: AppFontSize.f10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppPadding.padding2,),

          // remove =====>>>
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.delete,color: AppColors.cError,),
          ),
        ],
      ),
    );
  }
}


//ListTile(
//             leading:const CircleAvatar(
//               radius: 25,
//               backgroundColor: Colors.grey,
//               backgroundImage: NetworkImage(
//                   'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
//             ),
//             horizontalTitleGap: 8,
//             title: const Text(
//               'اهلا وسهلا بكم في تطبيق الدراسة',
//               style: AppStyles.title500,
//             ),
//             subtitle: IntrinsicHeight(
//               child: Row(
//                 children: [
//                   const Icon(
//                     IconlyBold.timeCircle,
//                     size: 15,
//                     color: AppColors.cTextSubtitleLight,
//                   ),
//                   const SizedBox(
//                     width: AppPadding.padding4,
//                   ),
//
//                   // date ======>>>
//                   Text(
//                     "12/12/2021",
//                     style: AppStyles.subtitle600.copyWith(
//                       fontSize: AppFontSize.f10,
//                     ),
//                   ),
//
//                   // height divider ======>>>
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: AppPadding.padding2,
//                     ),
//                     child: Container(
//                       color: AppColors.cTextSubtitleLight,
//                       width: 1,
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: AppPadding.padding4,
//                       ),
//                     ),
//                   ),
//
//                   // since =====>>>
//                   Text(
//                     'منذ 5 دقائق',
//                     style: AppStyles.subtitle600.copyWith(
//                       fontSize: AppFontSize.f10,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             trailing: const AssetSvgImage(
//               AppImages.removeSvg,
//             ),
//           )
