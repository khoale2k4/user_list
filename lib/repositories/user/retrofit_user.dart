import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_user.g.dart';

@RestApi(baseUrl: "https://reqres.in/api")
abstract class RetrofitUser {
  factory RetrofitUser(Dio dio, {String? baseUrl}) = _RetrofitUser;

  @GET("/users")
  Future<dynamic> getUsers(@Query("page") int page);

  @GET("/users/{id}")
  Future<dynamic> getUserDetail(@Path("id") String id);

  @POST("/users")
  Future<dynamic> createUser(@Body() Map<String, dynamic> user);
}
