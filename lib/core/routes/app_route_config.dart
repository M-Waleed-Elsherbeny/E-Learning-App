// import 'package:flutter/material.dart';


// class AppRouteConfig {
//   Route onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutePath.loginScreen:
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider<LoginCubit>(
//                   create: (context) => LoginCubit(),
//                   child: LoginScreen(),
//                 ));
//       case AppRoutePath.homeScreen:
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider<ProductsCubit>(
//                   create: (context) => ProductsCubit()..getAllProducts(),
//                   child: HomeScreen(),
//                 ));
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ));
//     }
//   }
// }
