import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/users/user_event.dart';
import 'package:user_list/blocs/users/user_state.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/repositories/user/interface_user_repository.dart';
import 'package:user_list/repositories/user/retrofit_user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RetrofitUser userRepository;

  UserBloc({required this.userRepository}) : super(const UserState.initial()) {
    on<FetchUserList>(_onFetchUserList);
    on<FetchUserDetail>(_onFetchUserDetail);
  }

  Future<void> _onFetchUserList(
    FetchUserList event,
    Emitter<UserState> emit,
  ) async {
    final isRefresh = event.page == null;
    int pageToFetch = event.page ?? 1;
    List<User> currentUsers = [];

    if (state is UserLoaded) {
      final currentState = state as UserLoaded;

      if (!isRefresh) {
        emit(currentState.copyWith(adding: true));
        currentUsers = currentState.users;
        pageToFetch = currentState.page + 1;
      } else {
        emit(const UserState.loading());
      }
    } else {
      emit(const UserState.loading());
    }

    final response = await userRepository.getUsers(pageToFetch);

    try {
      if (
          // response.success &&
          response != null) {
        final List<User> fetchedUsers = (response['data'] as List)
            .map((user) => User.fromJson(user))
            .toList();
        emit(UserState.loaded(
          users: isRefresh ? fetchedUsers : [...currentUsers, ...fetchedUsers],
          page: pageToFetch,
        ));
      } else {
        emit(UserState.error(response.message));
      }
    } catch (error) {
      emit(UserState.error(response.message));
    }
  }

  Future<void> _onFetchUserDetail(
    FetchUserDetail event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    final response = await userRepository.getUserDetail(event.userId);

    if (response != null && response['data'] != null) {
      emit(UserState.detailLoaded(User.fromJson(response['data'])));
    } else {
      emit(UserState.error(response.message));
    }
  }
}
