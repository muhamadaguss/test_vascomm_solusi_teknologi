part of 'register_cubit.dart';

class RegisterState {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  const RegisterState({
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
  });

  RegisterState copyWith({
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return RegisterState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}
