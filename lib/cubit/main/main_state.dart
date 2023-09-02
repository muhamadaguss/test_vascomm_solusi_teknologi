part of 'main_cubit.dart';

class MainState {
  final int? item;
  const MainState({
    this.item,
  });

  MainState copyWith({
    int? item,
  }) {
    return MainState(
      item: item ?? this.item,
    );
  }
}
