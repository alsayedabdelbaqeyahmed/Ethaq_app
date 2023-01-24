import 'package:ethaqapp/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_sizes.dart';

ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: AppColors.cIconDark),
      dividerTheme: const DividerThemeData(color: AppColors.cDividerDark),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.cTextSubtitleLight,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        labelStyle: const TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.w600,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.secondColor,
            width: 2.0,
          ),
          insets: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.f16,
        ),
        elevation: 0.0,
        backgroundColor: AppColors.cAppBarDark,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.cAppBarIconDark,
        ),
      ),
      primarySwatch: AppColors.cPrimary,
      fontFamily: 'Cairo',
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        headline1: TextStyle(),
        headline6: TextStyle(),
        button: TextStyle(color: AppColors.cTextButtonDark),
        caption: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        overline: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
      ).apply(
        bodyColor: AppColors.cTextDark,
        displayColor: Colors.blue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme:
            IconThemeData(size: 30.0, color: AppColors.cUnSelectedIconDark),
        selectedIconTheme:
            IconThemeData(size: 30.0, color: AppColors.cSelectedIcon),
        backgroundColor: AppColors.cBottomBarDark,
        selectedItemColor: AppColors.cSelectedIcon,
        unselectedItemColor: AppColors.cUnSelectedIconDark,
        elevation: 8.0,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.cSelectedIcon,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.cUnSelectedIconDark,
        ),
      ),
      scaffoldBackgroundColor: AppColors.cScaffoldBackgroundColorDark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.cPrimary,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.cTextDark,
        textColor: AppColors.cTextDark,
        selectedColor: AppColors.cSelectedIcon,
      ),
    );
