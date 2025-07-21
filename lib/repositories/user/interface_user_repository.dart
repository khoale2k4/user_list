import 'package:user_list/models/response_model.dart';
import 'package:user_list/models/user_model.dart';

abstract class IUserRepository {
  Future<Response> getUsers({int page = 1});
  Future<Response> getUserDetail(String id);
  Future<Response> createUser(User user);
}
