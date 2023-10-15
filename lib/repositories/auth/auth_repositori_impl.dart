import 'package:dio/dio.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo with DioClientMixin {
  @override
  Future<String?> logIn(AuthModel model) async {
    final response = await dio.post(
      endPoint: EndPoints.logIn,
      data: model.toJson(),
    );
    if (response.success) {
      final token = response.data['access_token'] as String;
      await LocalStorage.saveToken(token..log(message: 'Tooken'));
      return token;
    }
    return null;
  }

  @override
  Future<String?> register(AuthModel model) async {
    final response = await dio.post(
      endPoint: EndPoints.register,
      data: model.toJson(),
    );
    if (response.success) {
      final token = response.data['access_token'] as String;
      await LocalStorage.saveToken((token)..log(message: 'Tokeen'));
      return token;
    }

    return null;
  }

  @override
  Future<ApiResponse> logOut(String token) async {
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await dio.delete(
      endPoint: EndPoints.logOut,
      options: Options(headers: headers),
    );
    if (response.success) {
      await LocalStorage.deleteToken();
    }
    return response;
  }

  @override
  Future<ApiResponse> authMe(String token) async {
    final headers = {
      'Authorization': 'Authorization: Bearer $token',
    };
    final response = await dio.get(
      endPoint: EndPoints.authMe,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}
