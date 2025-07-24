import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/theme/theme_bloc.dart';
import 'package:user_list/blocs/users/user_bloc.dart';
import 'package:user_list/repositories/user/interface_user_repository.dart';
import 'package:user_list/repositories/user/retrofit_user.dart';
import 'package:user_list/repositories/user/user_repository_retrofit.dart';
import 'package:user_list/repositories/user/user_repository_v1.dart';
import 'package:user_list/repositories/user/user_repository_v2.dart';

enum UserRepo { mock, main, retrofit }

IUserRepository getUserRepo(UserRepo repo) {
  switch (repo) {
    case UserRepo.mock:
      return MockUserRepo();
    case UserRepo.main:
      return UserRepository();
    case UserRepo.retrofit:
      return UserRepoRetrofit();
  }
}

List<BlocProvider> getGlobalBlocs() {
  IUserRepository userRepo = getUserRepo(UserRepo.retrofit);
  return [
    BlocProvider<UserBloc>(
      create: (_) => UserBloc(userRepository: userRepo),
    ),
    BlocProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
    ),
  ];
}
