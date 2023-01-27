import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/lawyer_profile/presentation/cubit/lawyer_profile_cubit.dart';
import 'package:ethaqapp/features/lawyer_profile/presentation/cubit/lawyser_profile_state.dart';
import 'package:ethaqapp/features/search_a_lawyer_screen/presentation/cubit/lawyers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/image_avatar/search_lawyer_avatar.dart';
import '../../../lawyer_profile/presentation/pages/lawyer_profile.dart';

class SearchLawyerContainer extends StatelessWidget {
  const SearchLawyerContainer({Key? key, this.name, this.photo, this.id})
      : super(key: key);

  final String? name;
  final num? id;
  final String? photo;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          // TODO:
          SearchLawyerAvatar(
            name: name!,
            imageUrl: photo!,
          ),

          // Text Button with Forward Icon ======>>>>
          BlocConsumer<LawyerProfileCubit, LawyerProfileState>(
            listener: (context, state) {},
            builder: (ctx, state) {
              final lawyercubit = LawyerProfileCubit.get(ctx);

              return InkWell(
                onTap: () {
                  lawyercubit.getProfileData(context, id!).then(
                        (value) => navigateTo(
                          context,
                          LawyerProfileScreen(id: id),
                        ),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
