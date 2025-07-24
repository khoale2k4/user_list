import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/theme/theme_event.dart';
import 'package:user_list/blocs/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState.currentTheme()) {
    on<GetTheme>(_onGetTheme);
    on<ChangeTheme>(_onChangeTheme);
  }

  Future<void> _onGetTheme(GetTheme event, Emitter<ThemeState> state) async {
    emit(ThemeState.currentTheme());
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<ThemeState> state) async {
    emit(ThemeState.currentTheme(theme: event.theme));
  }
}
