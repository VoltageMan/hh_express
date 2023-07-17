import 'dart:async';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/models/profile/user/user_model.dart';

abstract class AuthRepo {
  Future<ApiResponse?> logIn(UserModel loginReqModel);
  Future<ApiResponse?> register(UserModel loginReqModel);
  Future<ApiResponse?> logOut(UserModel loginReqModel);
  Future<ApiResponse?> authMe();
}
