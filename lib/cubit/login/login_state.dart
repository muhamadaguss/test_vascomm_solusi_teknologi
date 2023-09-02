part of 'login_cubit.dart';

class LoginState {
  final bool isVisible;
  final Result<LoginResponseModel>? isLogin;
  const LoginState({
    this.isVisible = true,
    this.isLogin,
  });

  LoginState copyWith({
    bool? isVisible,
    Result<LoginResponseModel>? isLogin,
  }) {
    return LoginState(
      isVisible: isVisible ?? this.isVisible,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}
