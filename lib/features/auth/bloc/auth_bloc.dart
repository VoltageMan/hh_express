import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:go_router/go_router.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/overlay_helper.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';
import 'package:hh_express/settings/enums.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState(apiState: APIState.init, termsConfirmed: false));
  final _repo = getIt<AuthRepo>();

  void confirmTerms(bool val) {
    emit(AuthState(
      apiState: APIState.init,
      termsConfirmed: val,
    ));
  }

  Future<Map<String, dynamic>?> authMe() async {
    emit(AuthState(
        apiState: APIState.loading, termsConfirmed: state.termsConfirmed));
    final token = LocalStorage.getToken;
    if (token == null) {
      // do log in
      appRouter.currentContext.push(AppRoutes.auth, extra: true);
      emit(AuthState(
          apiState: APIState.init, termsConfirmed: state.termsConfirmed));
      return null;
    }
    final response = await _repo.authMe(token);
    if (response.success) {
      emit(AuthState(
          apiState: APIState.success,
          message: response.message,
          termsConfirmed: state.termsConfirmed));
      return response.data;
    }
    emit(AuthState(
        apiState: APIState.error,
        message: response.message,
        termsConfirmed: state.termsConfirmed));
    return null;
  }

  bool checkName(String? name) {
    'theName $name'.log();
    if (name == null || name.length >= 5) {
      return true;
    }
    if (name.contains(' ')) {
      emit(AuthState(
          apiState: APIState.error,
          message: 'length of UserName less than 5',
          termsConfirmed: state.termsConfirmed));
    }
    emit(AuthState(
        apiState: APIState.error,
        message: 'length of UserName less than 5',
        termsConfirmed: state.termsConfirmed));
    'Number is incorrect'.log();
    return false;
  }

  bool checkNum(String num) {
    num.log();
    if (num.length != 11) {
      emit(AuthState(
          apiState: APIState.error,
          message: 'length of Number less than 8',
          termsConfirmed: state.termsConfirmed));
      'Number is incorrect'.log();
      return false;
    }
    return true;
  }

  bool checkPass(String model) {
    if (model.length < 5) {
      emit(AuthState(
          apiState: APIState.error,
          message: 'Length of password less than 5',
          termsConfirmed: state.termsConfirmed));
      'password Length must be more than 8'.log();
      return false;
    }
    return true;
  }

  Future<bool> logIn(AuthModel data) async {
    emit(
      AuthState(
        apiState: APIState.loading,
        termsConfirmed: state.termsConfirmed,
      ),
    );
    OverlayHelper.showLoading();
    final response = await _repo.logIn(data);
    if (response != null) {
      emit(
        AuthState(
          apiState: APIState.success,
          message: 'success',
          termsConfirmed: state.termsConfirmed,
        ),
      );
      OverlayHelper.remove();
      return true;
    }

    OverlayHelper.remove();
    wrongState('Error');
    return false;
  }

  // Future<bool> logOut() async {
  //   emit(AuthState(
  //       apiState: APIState.loading, termsConfirmed: state.termsConfirmed));
  //   OverlayHelper.showLoading();
  //   final token = LocalStorage.getToken;
  //   final response = await _repo.logOut(token!);
  //   if (response.success) {
  //     emit(AuthState(
  //         apiState: APIState.success,
  //         message: response.message,
  //         termsConfirmed: state.termsConfirmed));
  //     OverlayHelper.remove();
  //     return true;
  //   }
  //   emit(
  //     AuthState(
  //       apiState: APIState.error,
  //       message: response.message,
  //       termsConfirmed: state.termsConfirmed,
  //     ),
  //   );
  //   OverlayHelper.remove();
  //   return false;
  // }

  Future<bool> singUp(AuthModel model) async {
    emit(
      AuthState(
        apiState: APIState.loading,
        termsConfirmed: state.termsConfirmed,
      ),
    );
    OverlayHelper.showLoading();
    final response = await _repo.register(model);
    if (response != null) {
      emit(
        AuthState(
          apiState: APIState.success,
          message: 'Success',
          termsConfirmed: state.termsConfirmed,
        ),
      );
      OverlayHelper.remove();
      return true;
    }
    OverlayHelper.remove();
    wrongState('Error');
    return false;
  }

  void wrongState(String message) {
    emit(
      AuthState(
        apiState: APIState.error,
        message: message,
        termsConfirmed: state.termsConfirmed,
      ),
    );
  }
}
