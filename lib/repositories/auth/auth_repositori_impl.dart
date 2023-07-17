import 'package:dio/dio.dart';
import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/models/auth/log_in_model.dart';
import 'package:hh_express/models/profile/user/user_model.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';
import 'package:hh_express/settings/consts.dart';

class AuthRepoImpl extends AuthRepo with DioClientMixin {
  @override
  Future<ApiResponse?> logIn(UserModel model) async {
    final response = await dio.post(
      endPoint: EndPoints.logIn,
      data: model.toJson(),
    );
    return response;
  }

  @override
  Future<ApiResponse?> register(UserModel model) async {
    final response = await dio.post(
      endPoint: EndPoints.register,
      data: model.toJson(),
    );
    return response;
  }

  @override
  Future<ApiResponse?> logOut(UserModel model) async {
    final response = await dio.delete(
        endPoint: EndPoints.logOut,
        data: model.toJson(),
        queryParameters: {
          'id': model.id,
        });
    return response;
  }

  @override
  Future<ApiResponse?> authMe() async {
    final response = await dio.get(
      endPoint: EndPoints.authMe,
    );
    return response;
  }
}
