import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class AppRouteConfig {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePath.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
