import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/users/user_event.dart';
import 'package:user_list/blocs/users/user_state.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = UserRepository();

  UserBloc() : super(UserInitial()) {
    on<FetchUserList>(_onFetchUserList);
    on<FetchUserDetail>(_onFetchUserDetail);
  }

  Future<void> _onFetchUserList(
      FetchUserList event, Emitter<UserState> emit) async {
    if (state is UserLoading) return;

    final isRefresh = event.page == null;
    int pageToFetch = event.page ?? 1;
    List<User> existingUsers = [];

    if (!isRefresh && state is UserLoaded) {
      emit(UserLoaded(
        users: (state as UserLoaded).users,
        page: (state as UserLoaded).page,
        adding: true,
      ));
      existingUsers = (state as UserLoaded).users;
      pageToFetch = event.page ?? (state as UserLoaded).page + 1;
    } else {
      emit(UserLoading());
    }

    final response = await userRepository.getUsers(page: pageToFetch);

    if (response.success && response.data != null) {
      final newUsers = response.data!;
      emit(UserLoaded(
        users: isRefresh ? newUsers : [...existingUsers, ...newUsers],
        page: pageToFetch,
        adding: false,
      ));
    } else {
      emit(UserError(response.message));
    }
  }

  Future<void> _onFetchUserDetail(
      FetchUserDetail event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final response = await userRepository.getUserDetail(event.userId);

    if (response.success) {
      emit(UserDetailLoaded(response.data!));
    } else {
      emit(UserError(response.message));
    }
  }
}
