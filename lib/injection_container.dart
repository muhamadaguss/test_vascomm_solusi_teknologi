import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vascomm/cubit/login/login_cubit.dart';
import 'package:test_vascomm/cubit/main/main_cubit.dart';
import 'package:test_vascomm/cubit/register/register_cubit.dart';
import 'package:test_vascomm/repositories/login_repository.dart';
import 'package:test_vascomm/repositories_impl/login_repository_impl.dart';
import 'package:test_vascomm/utils/network_info.dart';

import 'api/api_client.dart';
import 'api/remote_datasource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  if (!sl.isRegistered<LoginCubit>()) {
    sl.registerLazySingleton<LoginCubit>(() => LoginCubit());
  }
  if (!sl.isRegistered<RegisterCubit>()) {
    sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit());
  }
  if (!sl.isRegistered<MainCubit>()) {
    sl.registerLazySingleton<MainCubit>(() => MainCubit());
  }

  //repository
  if (!sl.isRegistered<LoginRepository>()) {
    sl.registerLazySingleton(
      () => LoginRepositoryImpl(
        networkInfoImpl: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }

  //Core
  if (!sl.isRegistered<GlobalKey<NavigatorState>>()) {
    sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
  }

  if (!sl.isRegistered<ScreenUtil>()) {
    sl.registerLazySingleton(() => ScreenUtil());
  }

  if (!sl.isRegistered<ApiClient>()) {
    sl.registerLazySingleton(() => ApiClient());
  }

  final sharedPreferences = await SharedPreferences.getInstance();
  if (!sl.isRegistered<SharedPreferences>()) {
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }

  if (!sl.isRegistered<NetworkInfoImpl>()) {
    sl.registerLazySingleton(() => NetworkInfoImpl());
  }

  if (!sl.isRegistered<RemoteDataSource>()) {
    sl.registerLazySingleton(() => RemoteDataSource());
  }
}
