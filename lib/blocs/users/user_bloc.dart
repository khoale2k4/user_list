import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/users/user_event.dart';
import 'package:user_list/blocs/users/user_state.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/repositories/user/interface_user_repository.dart';
import 'package:user_list/repositories/user/user_repository_v2.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;

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

    final response = await userRepository.getUsers(page: pageToFetch);

    if (response.success && response.data != null) {
      final fetchedUsers = response.data!;
      emit(UserState.loaded(
        users: isRefresh ? fetchedUsers : [...currentUsers, ...fetchedUsers],
        page: pageToFetch,
      ));
    } else {
      emit(UserState.error(response.message));
    }
  }

  Future<void> _onFetchUserDetail(
    FetchUserDetail event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    final response = await userRepository.getUserDetail(event.userId);

    if (response.success && response.data != null) {
      emit(UserState.detailLoaded(response.data!));
    } else {
      emit(UserState.error(response.message));
    }
  }
}
