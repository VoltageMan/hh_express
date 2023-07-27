import 'dart:async';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/models/profile/user/user_model.dart';

abstract class AuthRepo {
  Future<ApiResponse> logIn(AuthModel loginReqModel);
  Future<ApiResponse> register(AuthModel loginReqModel);
  Future<ApiResponse> logOut(String token);
  Future<ApiResponse> authMe(String token);
}
