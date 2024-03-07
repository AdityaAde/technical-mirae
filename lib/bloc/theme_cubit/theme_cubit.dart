import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  factory ThemeCubit.create() => ThemeCubit()..setThemeMode(false);

  ThemeCubit() : super(const ThemeState.initial());

  void setThemeMode(bool value) {
    emit(const ThemeState.loading());
    emit(ThemeState.success(value));
  }
}
