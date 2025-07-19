import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_list/models/response_model.dart';
import 'package:user_list/models/user_model.dart';

class UserRepository {
  String baseUrl = 'https://reqres.in/api/users';

  Future<Response<List<User>>> getUsers({page = 1}) async {
    try {
      final url = Uri.parse('$baseUrl?page=$page');
      final headers = {'x-api-key': 'reqres-free-v1'};
      final res = await http.get(headers: headers, url);

      if (res.statusCode == 200) {
        final jsonBody = json.decode(res.body);
        final List usersJson = jsonBody['data'];

        final users = usersJson.map((u) => User.fromJson(u)).toList();

        return Response(true, "Fetched successfully", users);
      } else {
        return Response(false, "Error: ${res.statusCode}", null);
      }
    } catch (error) {
      print("Error fetching users: $error");
      return Response(false, "Error fetching users: $error", null);
    }
  }

  Future<Response<User>> getUserDetail(String id) async {
    try {
      final url = Uri.parse('$baseUrl/$id');
      final headers = {'x-api-key': 'reqres-free-v1'};
      final res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        final jsonBody = json.decode(res.body);
        final userJson = jsonBody['data'];
        final user = User.fromJson(userJson);

        return Response(true, "Fetched user detail", user);
      } else {
        return Response(false, "Error: ${res.statusCode}", null);
      }
    } catch (error) {
      print("Error fetching user detail: $error");
      return Response(false, "Error fetching user detail: $error", null);
    }
  }
}
