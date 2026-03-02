import 'dart:developer';
import 'package:e_learning_app/core/networking/supabase_services.dart';
import 'package:e_learning_app/core/routes/app_route_config.dart';
import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/core/services/bloc_observer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SupabaseServices.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    log("$deviceWidth , $deviceHeight");
    return ScreenUtilInit(
      designSize: Size(deviceWidth, deviceHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Learning App',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
            textTheme: Typography.englishLike2018.apply(
              fontFamily: GoogleFonts.tenorSans().fontFamily,
              fontSizeFactor: 1.sp,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.kScaffoldBackgroundColor,
            ),
          ),
          initialRoute: AppRoutePath.loginScreen,
          onGenerateRoute: AppRouteConfig().onGenerateRoute,
        );
      },
    );
  }
}

// m@gmail.com
// 12345678
