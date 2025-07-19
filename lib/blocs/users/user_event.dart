import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  
  @override
  List<Object?> get props => [];
}

class FetchUserList extends UserEvent {
  final int? page;

  FetchUserList({this.page});

  @override
  List<Object?> get props => [page];
}


class FetchUserDetail extends UserEvent {
  final String userId;

  const FetchUserDetail(this.userId);

  @override
  List<Object?> get props => [userId];
}
