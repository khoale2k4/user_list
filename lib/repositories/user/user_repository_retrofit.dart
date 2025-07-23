import 'package:dio/dio.dart' as dio;
import 'package:user_list/models/response_model.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/repositories/user/retrofit_user.dart';

import 'interface_user_repository.dart';

class UserRepoRetrofit implements IUserRepository {
  late final RetrofitUser retrofitUser;

  UserRepoRetrofit() {
    final dioRepo = dio.Dio();
    dioRepo.options.headers['x-api-key'] = 'reqres-free-v1';
    retrofitUser = RetrofitUser(dioRepo);
  }

  @override
  Future<Response> createUser(Map<String, dynamic> user) async {
    try {
      final response = await retrofitUser.createUser(user);
      return Response(
          success: true,
          data: response["data"],
          message: "Created user successfully");
    } catch (error) {
      return Response(success: false, data: null, message: error.toString());
    }
  }

  @override
  Future<Response> getUserDetail(String id) async {
    try {
      final response = await retrofitUser.getUserDetail(id);
      return Response(
          success: true,
          data: User.fromJson(response["data"]),
          message: "Get user detail successfully");
    } catch (error) {
      return Response(success: false, data: null, message: error.toString());
    }
  }

  @override
  Future<Response> getUsers({int page = 1}) async {
    try {
      final response = await retrofitUser.getUsers(page);
      final List<User> userList = (response['data'] as List)
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();
      return Response(
          success: true, data: userList, message: "Get users successfully");
    } catch (error) {
      return Response(success: false, data: null, message: error.toString());
    }
  }
}
