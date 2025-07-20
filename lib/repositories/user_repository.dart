import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_list/models/response_model.dart';
import 'package:user_list/models/user_model.dart';

class UserRepository {
  String baseUrl = 'https://reqres.in/api/users';

  Future<Response> getUsers({page = 1}) async {
    try {
      final url = Uri.parse('$baseUrl?page=$page');
      final headers = {'x-api-key': 'reqres-free-v1'};
      final res = await http.get(headers: headers, url);

      if (res.statusCode == 200) {
        final jsonBody = json.decode(res.body);
        final List usersJson = jsonBody['data'];

        // for (var u in usersJson) {
        //   try {
        //     final user = User.fromJson(u);
        //     print('Parsed user: $user');
        //   } catch (e) {
        //     print('Lỗi với user: $u');
        //     print(e);
        //   }
        // }
        final users = usersJson.map((u) => User.fromJson(u)).toList();
        // print(jsonBody);

        return Response(
          success: true,
          data: users,
          message: "Fetched successfully",
        );
        ;
      } else {
        return Response(
          success: false,
          message: "Error: ${res.statusCode}",
          data: null,
        );
      }
    } catch (error) {
      print("Error fetching users: $error");
      return Response(
        success: false,
        message: "Error fetching users: $error",
        data: null,
      );
    }
  }

  Future<Response> getUserDetail(String id) async {
    try {
      final url = Uri.parse('$baseUrl/$id');
      final headers = {'x-api-key': 'reqres-free-v1'};
      final res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        final jsonBody = json.decode(res.body);
        final userJson = jsonBody['data'];
        final user = User.fromJson(userJson);

        return Response(
          success: true,
          message: "Fetched user detail",
          data: user,
        );
      } else {
        return Response(
          success: false,
          message: "Error: ${res.statusCode}",
          data: null,
        );
      }
    } catch (error) {
      print("Error fetching user detail: $error");
      return Response(
        success: false,
        message: "Error fetching user detail: $error",
        data: null,
      );
    }
  }

  Future<Response> createUser(User user) async {
    try {
      final url = Uri.parse(baseUrl);
      final headers = {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      };
      final body = json.encode(user.toJson());

      final res = await http.post(url, headers: headers, body: body);

      if (res.statusCode == 201) {
        final jsonBody = json.decode(res.body);
        final user = User.fromJson(jsonBody);

        return Response(
          success: true,
          message: "User created successfully",
          data: user,
        );
      } else {
        return Response(
          success: false,
          message: "Failed to create user: ${res.statusCode}",
          data: null,
        );
      }
    } catch (error) {
      print("Error creating user: $error");
      return Response(
        success: false,
        message: "Error creating user: $error",
        data: null,
      );
    }
  }
}
