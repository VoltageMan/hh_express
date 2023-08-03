import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:go_router/go_router.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';
import 'package:hh_express/settings/enums.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState(apiState: APIState.init));
  final _repo = getIt<AuthRepo>();

  void init() {
    emit(AuthState(apiState: APIState.init));
  }

  Future<Map<String, dynamic>?> authMe() async {
    emit(AuthState(apiState: APIState.loading));
    final token = await LocalStorage.getToken();
    if (token == null) {
      // do log in
      appRouter.currentContext.push(AppRoutes.auth, extra: true);
      emit(AuthState(apiState: APIState.init));
      return null;
    }
    final response = await _repo.authMe(token);
    if (response.success) {
      emit(AuthState(apiState: APIState.succses, message: response.message));
      return response.data;
    }
    emit(AuthState(apiState: APIState.error, message: response.message));
    return null;
  }

  bool checkName(String? name) {
    'theName $name'.log();
    if (name == null || name.length >= 5) {
      return true;
    }
    if (name.contains(' ')) {
      emit(AuthState(
          apiState: APIState.error, message: 'length of UserName less than 5'));
    }
    emit(AuthState(
        apiState: APIState.error, message: 'length of UserName less than 5'));
    'Number is incorrect'.log();
    return false;
  }

  bool checkNum(String num) {
    num.log();
    if (num.length != 11) {
      emit(AuthState(
          apiState: APIState.error, message: 'length of Number less than 8'));
      'Number is incorrect'.log();
      return false;
    }
    return true;
  }

  bool checkPass(String model) {
    if (model.length < 5) {
      emit(AuthState(
          apiState: APIState.error, message: 'Length of password less than 5'));
      'password Length must be more than 8'.log();
      return false;
    }
    return true;
  }

  Future<bool> logIn(AuthModel data) async {
    emit(AuthState(apiState: APIState.loading));
    final response = await _repo.logIn(data);
    if (!response.success) {
      emit(AuthState(apiState: APIState.error, message: response.message));
      return false;
    }
    if (response.success) {
      final responseData = response.data;

//Save Token
      emit(AuthState(apiState: APIState.succses, message: response.message));
      return true;
    }
    wrongState(response.message);
    return false;
  }

  Future<bool> logOut() async {
    emit(AuthState(apiState: APIState.loading));
    final token = await LocalStorage.getToken();
    final response = await _repo.logOut(token!);
    if (response.success) {
      emit(AuthState(apiState: APIState.succses, message: response.message));
      return true;
    }
    emit(AuthState(apiState: APIState.error, message: response.message));
    return false;
  }

  Future<bool> singUp(AuthModel model) async {
    emit(AuthState(apiState: APIState.loading));
    final response = await _repo.register(model);
    if (!response.success) {
      emit(AuthState(apiState: APIState.error, message: response.message));
      return false;
    }
    if (response.success) {
      await LocalStorage.saveToken(response.data['accec_token']);
      emit(AuthState(
        apiState: APIState.succses,
        message: response.message,
      ));
      return true;
    }
    wrongState(response.message);
    return false;
  }

  void wrongState(String message) {
    emit(
      AuthState(
        apiState: APIState.error,
        message: message,
      ),
    );
  }
}
