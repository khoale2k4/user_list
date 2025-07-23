import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_user.g.dart';

@RestApi(baseUrl: "https://reqres.in/api")
abstract class RetrofitUser {
  factory RetrofitUser(Dio dio, {String? baseUrl}) = _RetrofitUser;

  @GET("/users")
  Future<dynamic> getUsers(@Query("page") int page); // Map<String, dynamic>

  @GET("/users/{id}")
  Future<dynamic> getUserDetail(@Path("id") String id); // Map<String, dynamic>

  @POST("/users")
  Future<dynamic> createUser(@Body() Map<String, dynamic> user); // Map<String, dynamic>
}
