

import 'package:dio/dio.dart';
import 'package:mockapi_users/network/user_response/user_response.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://5e510330f2c0d300147c034c.mockapi.io")
abstract class ApiService{

  factory ApiService(Dio dio, {String? baseUrl}){

    dio.options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (status) => true,
      headers: {'content-type': 'application/json'},
      contentType: 'application/json');

      return _ApiService (dio, baseUrl: baseUrl);

  }


  @GET('/user')
  @FormUrlEncoded()
  Future<List<UserResponse>> getAllUsers();


}