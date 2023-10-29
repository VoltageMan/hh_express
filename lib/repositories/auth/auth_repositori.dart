import 'dart:async';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/models/auth/auth_model.dart';

abstract class AuthRepo {
  Future<String?> logIn(AuthModel loginReqModel);
  Future<String?> register(AuthModel loginReqModel);
  Future<bool> logOut();
  Future<ApiResponse> authMe();
}
