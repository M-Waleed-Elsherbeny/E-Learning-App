import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/features/auth/data/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/auth/presentation/view/login_view.dart';
import 'package:e_learning_app/features/auth/presentation/view/signup_view.dart';
import 'package:e_learning_app/features/course_details/presentation/view/course_details_view.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:e_learning_app/features/navigation/data/cubit/navigation_cubit.dart';
import 'package:e_learning_app/features/navigation/presentation/view/layout_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteConfig {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePath.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          ),
        );

      case AppRoutePath.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: const SignupView(),
          ),
        );

      case AppRoutePath.layoutBottomNavigationBar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(),
            child: const LayoutBottomNavigationBar(),
          ),
        );

      case AppRoutePath.courseDetails:
        return MaterialPageRoute(
          builder: (context) {
            final CourseModel courseModel = settings.arguments as CourseModel;
            return CourseDetailsView(courseModel: courseModel);
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
