import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/features/main_screen/presentation/cubit/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../cubit/main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit, MainScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MainScreenCubit.get(context);
          return Scaffold(
            body: PageView.builder(
              controller: cubit.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cubit.pages.length,
              itemBuilder: (context, index) => cubit.pages[cubit.currentPageIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(IconlyLight.message),
                  activeIcon: const Icon(IconlyBold.message),
                  label: 'consulting'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(IconlyLight.home),
                  activeIcon: const Icon(IconlyBold.home),
                  label: 'home'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(IconlyLight.category),
                  activeIcon: const Icon(IconlyBold.category),
                  label: 'requests'.tr(),
                ),
              ],
              onTap: (index) {
                cubit.changePage(index);
              },
            ),
          );
        },
      ),
    );
  }
}
