import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/features/auth/data/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/auth/presentation/views/login_view.dart';
import 'package:e_learning_app/features/auth/presentation/views/signup_view.dart';
import 'package:e_learning_app/features/home/presentation/view/home_view.dart';
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

      case AppRoutePath.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
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
