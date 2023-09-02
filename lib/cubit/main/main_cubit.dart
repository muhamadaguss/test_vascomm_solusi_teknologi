import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vascomm/injection_container.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void changeItem(int item) {
    emit(state.copyWith(item: item));
  }

  void logOut() {
    sl<SharedPreferences>().clear();
    emit(state.copyWith(item: 0));
  }
}
