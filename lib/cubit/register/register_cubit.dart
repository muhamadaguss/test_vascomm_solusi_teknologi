import 'package:bloc/bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void isPasswordVisible() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void isConfirmPasswordVisible() {
    emit(state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
  }
}
