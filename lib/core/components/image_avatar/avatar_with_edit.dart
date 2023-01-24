import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';

class AvatarWithEdit extends StatelessWidget {
  const AvatarWithEdit({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    this.imageFile,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String imageUrl;
  final XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        if (imageFile != null)
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.transparent,
            backgroundImage: FileImage(File(imageFile!.path)),
          )
        else
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.transparent,
            backgroundImage: CachedNetworkImageProvider(
              "${AppConst.mediaUrl}$imageUrl",
            ),
          ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.padding4),
            decoration: const BoxDecoration(
              color: AppColors.cPrimary,
              borderRadius: BorderRadius.all(
                Radius.circular(AppBorderRadius.radius8),
              ),
            ),
            child: const Icon(
              IconlyLight.editSquare,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
