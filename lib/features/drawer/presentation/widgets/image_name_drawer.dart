import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/my_profile/presentation/cubit/my_profile_cubit.dart';
import 'package:ethaqapp/features/my_profile/presentation/cubit/my_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageNameDrawer extends StatelessWidget {
  const ImageNameDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProfileCubit, MyProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final myProfileCubit = MyProfileCubit.get(context);
        return state is MyProfileLoadingState
            ? const LoadingWidget()
            : state is MyProfileSuccessState &&
                    myProfileCubit.myProfileModel != null
                ? Column(
                    children: [
                      // profile image =====>>>
                      Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.all(AppPadding.largePadding),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              "${AppConst.mediaUrl}${myProfileCubit.myProfileModel!.dataMyProfile!.userMyProfile!.photo}",
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // name =====>>>
                      Text(
                        '${myProfileCubit.myProfileModel!.dataMyProfile!.userMyProfile!.name}',
                        style: AppStyles.title500.copyWith(
                          fontSize: AppFontSize.f12,
                        ),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        height: 30,
                      ),
                    ],
                  )
                : const SizedBox.shrink();
      },
    );
  }
}
