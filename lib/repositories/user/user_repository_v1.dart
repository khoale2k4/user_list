import 'package:user_list/models/response_model.dart';
import 'package:user_list/models/user_model.dart';

import 'interface_user_repository.dart';

class MockUserRepo implements IUserRepository {
  @override
  Future<Response> createUser(Map<String, dynamic> user) async {
    return Response(success: true, data: null, message: "OK");
  }

  @override
  Future<Response> getUserDetail(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    return Response(success: true, data: User(id: 1, first_name: 'Mock User 1', last_name: "MU1", avatar: "abc", email: "a@gmail.com"), message: "OK");
  }

  @override
  Future<Response> getUsers({int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 300));
    return Response(success: true, data: [User(id: 1, first_name: 'Mock User 1', last_name: "MU1", avatar: "abc", email: "a@gmail.com"),], message: "OK");
  }
}
