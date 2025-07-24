import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/models/theme_model.dart';

part 'theme_event.freezed.dart';

@freezed
class ThemeEvent with _$ThemeEvent{
  const factory ThemeEvent.getTheme() = GetTheme;
  const factory ThemeEvent.changeTheme({@Default(ThemeModel.system) ThemeModel theme}) = ChangeTheme;
}