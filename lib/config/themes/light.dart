import 'package:ethaqapp/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_sizes.dart';

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: AppColors.cIconLight),
      dividerTheme: const DividerThemeData(color: AppColors.cDividerLight),
      primarySwatch: AppColors.cPrimary,
      tabBarTheme:  TabBarTheme(
        labelColor: Colors.black,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        unselectedLabelColor: AppColors.cTextSubtitleLight,
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
        centerTitle: true,
        backgroundColor: AppColors.cAppBarLight,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        iconTheme: IconThemeData(
          color: AppColors.cAppBarIconLight,
        ),
      ),
      //primarySwatch: MyColors.cPrimary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.cPrimary,
      ),
      fontFamily: 'Cairo',
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        headline1: TextStyle(),
        headline6: TextStyle(),
        button: TextStyle(color: AppColors.cTextButtonLight),
        caption: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        overline: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
      ).apply(
        bodyColor: AppColors.cTextLight,
        displayColor: Colors.blue,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(size: 30.0, color: AppColors.cPrimary.withOpacity(0.5)),
        selectedIconTheme: const IconThemeData(size: 30.0, color: AppColors.cPrimary,),
        backgroundColor: AppColors.cBottomBarLight,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cPrimary.withOpacity(0.5),
        elevation: 40,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.cPrimary,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.cPrimary.withOpacity(0.5),
        ),
      ),
      scaffoldBackgroundColor: AppColors.cScaffoldBackgroundColorLight,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.cPrimary,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.cIconLight,
        textColor: AppColors.cTextLight,
        selectedColor: AppColors.cSelectedIcon,
      ),
    );
