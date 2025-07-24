import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/models/theme_model.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState{
  const factory ThemeState.currentTheme({@Default(ThemeModel.system) ThemeModel theme}) = CurrentTheme;
}