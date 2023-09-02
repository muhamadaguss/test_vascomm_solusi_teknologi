import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_vascomm/cubit/login/login_cubit.dart';
import 'package:test_vascomm/cubit/main/main_cubit.dart';
import 'package:test_vascomm/cubit/register/register_cubit.dart';

import 'injection_container.dart';

List<BlocProvider> get providers => [
      BlocProvider<LoginCubit>(
        create: (context) => sl<LoginCubit>(),
      ),
      BlocProvider<RegisterCubit>(
        create: (context) => sl<RegisterCubit>(),
      ),
      BlocProvider<MainCubit>(
        create: (context) => sl<MainCubit>(),
      ),
    ];
