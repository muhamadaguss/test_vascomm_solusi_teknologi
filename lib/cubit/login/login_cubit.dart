import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';
import '../../models/login_model.dart';
import '../../repositories/login_repository.dart';
import '../../repositories_impl/login_repository_impl.dart';
import '../../utils/result.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository = sl<LoginRepositoryImpl>();
  LoginCubit() : super(const LoginState());

  void isVisible() {
    emit(state.copyWith(isVisible: !state.isVisible));
  }

  void login(Map<String, dynamic> loginModel) async {
    emit(state.copyWith(isLogin: Result.loading()));
    final result = await loginRepository.login(loginModel);

    result.fold((failure) {
      emit(state.copyWith(
        isLogin: Result.error(failure.message),
      ));
    }, (result) {
      sl<SharedPreferences>().setBool('isLogin', true);
      emit(state.copyWith(
        isLogin: Result.completed(result),
      ));
    });
  }
}
