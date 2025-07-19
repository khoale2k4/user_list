import 'package:equatable/equatable.dart';
import 'package:user_list/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final int page;
  bool adding = false;

  UserLoaded({required this.users, required this.page, this.adding = false});

  @override
  List<Object?> get props => [users, page, adding];
}

class UserDetailLoaded extends UserState {
  final User user;

  const UserDetailLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
