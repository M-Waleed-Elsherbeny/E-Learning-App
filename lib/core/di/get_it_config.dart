// import 'package:dio/dio.dart';
// import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';
// import 'package:flutter_advanced_course_omar_ahmed/core/networking/dio_handler.dart';
// import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/login_cubit.dart';
// import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/sign_up_cubit.dart';
// import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/auth_repo.dart';
// import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_cubit.dart';
// import 'package:flutter_advanced_course_omar_ahmed/features/home/data/repo/specialty_doctors_api.dart';
// import 'package:get_it/get_it.dart';

// final GetIt getIt = GetIt.instance;

// void setupGetIt() {
//   // Dio And ApiServices
//   Dio? dio = DioHandler.initialDio();
//   getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

//   // Login repository And Cubit
//   getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt<ApiServices>()));
//   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));

//   // SignUp repository And Cubit
//   getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<AuthRepo>()));

//   // Home repository And Cubit
//   getIt.registerLazySingleton<SpecialtyDoctorsRepo>(() => SpecialtyDoctorsRepo(apiServices: getIt<ApiServices>()));
//   getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<SpecialtyDoctorsRepo>()));
// }
