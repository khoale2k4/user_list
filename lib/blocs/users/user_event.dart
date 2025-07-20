import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.fetchUserList({int? page}) = FetchUserList;
  const factory UserEvent.fetchUserDetail(String userId) = FetchUserDetail;
}
