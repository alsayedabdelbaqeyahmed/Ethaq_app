import 'package:ethaqapp/features/main_screen/presentation/cubit/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../consulting_screen/presentation/pages/consulting_screen.dart';
import '../../../home_screen/presentation/pages/home_screen.dart';
import '../../../requests_screen/presentation/pages/requests_screen.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  static MainScreenCubit get(BuildContext context) => BlocProvider.of(context);

  int currentPageIndex = 1;
  final PageController pageController = PageController(initialPage: 1);
  final List<Widget> pages = [
    const ConsultingScreen(),
    const HomeScreen(),
    const RequestsScreen(),
  ];

  // change page ========>>>
  void changePage(int index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
    emit(ChangePageState());
  }
}
