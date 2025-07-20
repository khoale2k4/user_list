import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/models/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;
  const factory UserState.loading() = UserLoading;
  const factory UserState.loaded({
    required List<User> users,
    required int page,
    @Default(false) bool adding,
  }) = UserLoaded;
  const factory UserState.detailLoaded(User user) = UserDetailLoaded;
  const factory UserState.error(String message) = UserError;
}
