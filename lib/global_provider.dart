import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/users/user_bloc.dart';
import 'package:user_list/repositories/user/interface_user_repository.dart';
import 'package:user_list/repositories/user/retrofit_user.dart';
import 'package:user_list/repositories/user/user_repository_v1.dart';
import 'package:user_list/repositories/user/user_repository_v2.dart';

enum UserRepo { v1, v2 }

IUserRepository getUserRepo(UserRepo repo) {
  switch (repo) {
    case UserRepo.v1:
      return MockUserRepo();
    case UserRepo.v2:
      return UserRepository();
  }
}

List<BlocProvider> getGlobalBlocs() {
  IUserRepository userRepo = getUserRepo(UserRepo.v1);
  final dio = Dio();
  dio.options.headers['x-api-key'] = 'reqres-free-v1';

  return [
    BlocProvider<UserBloc>(
      create: (_) => UserBloc(userRepository:  RetrofitUser(dio)),
    ),
  ];
}
