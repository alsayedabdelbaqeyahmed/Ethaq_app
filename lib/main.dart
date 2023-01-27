import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/bloc_observer.dart';
import 'package:ethaqapp/config/themes/dark.dart';
import 'package:ethaqapp/config/themes/light.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/login/login_screen.dart';
import 'package:ethaqapp/features/intro_screen/intro_screen/presentation/pages/intro_screen.dart';
import 'package:ethaqapp/features/lawyer_profile/presentation/cubit/lawyer_profile_cubit.dart';
import 'package:ethaqapp/features/main_screen/presentation/pages/main_screen.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/cubit/new_ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'features/my_profile/presentation/cubit/my_profile_cubit.dart';

Widget appStartScreen = const IntroScreen();

Future<void> startScreen() async {
  await Hive.initFlutter();
  final mainBox = await Hive.openBox(AppConst.mainBoxName);
  // dark mode
  //final isDark = await mainBox.get(AppConstants.isDarkBox);
  //AppCubit.isDark = isDark ?? false;
  final bool isIntroFinished =
      await mainBox.get(AppConst.introFinishBox) ?? false;
  final String? token = await mainBox.get(AppConst.tokenBox);
  if (isIntroFinished == false) {
    appStartScreen = const IntroScreen();
  } else if (token == null) {
    appStartScreen = const LoginScreen();
  } else {
    appStartScreen = const MainScreen();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await EasyLocalization.ensureInitialized();
  await startScreen();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'SA'),
        ],
        path: 'assets/translation',
        startLocale: const Locale('ar', 'SA'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyProfileCubit()..getMyProfile(context),
        ),
        BlocProvider(
          create: (context) => LawyerProfileCubit(),
        ),
      ],
      child: MaterialApp(
        title: AppConst.appName,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.light,
        home: appStartScreen,
      ),
    );
  }
}
