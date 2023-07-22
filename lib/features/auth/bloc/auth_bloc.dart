import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/models/profile/user/user_model.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';
import 'package:hh_express/settings/enums.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState(aPiState: APiState.init));
  final _repo = getIt<AuthRepo>();

  void init() {
    emit(AuthState(aPiState: APiState.init));
  }

  Future<void> authMe() async {
    emit(AuthState(aPiState: APiState.loading));
    final response = await _repo.authMe();
    if (response.success) {
      emit(AuthState(aPiState: APiState.succses, message: response.message));
    }
    emit(AuthState(aPiState: APiState.error, message: response.message));
  }

  Future<void> logIn(AuthModel data) async {
    if (data.entity.length < 8) {
      emit(AuthState(
          aPiState: APiState.error, message: 'length of Number less than 8'));
      'Number is incorrect'.log();
      return;
    }
    if (data.password.length < 5) {
      emit(AuthState(
          aPiState: APiState.error, message: 'Password of Number less than 5'));
      'password Length must be more than 8'.log();
      return;
    }
    emit(AuthState(aPiState: APiState.loading, message: ''));
    final response = await _repo.logIn(data);
    if (response.success == null || !response.success!) {
      emit(
        AuthState(
          aPiState: APiState.error,
          message: response.message,
        ),
      );
      return;
    }
    if (response.success!) {
      final responseData = response.data;
      final user = UserModel.fromJson(responseData['user'])
          .addToken(responseData['access_token']);
      LocalStorage.saveMe(user);
      emit(AuthState(aPiState: APiState.succses, message: response.message));
      return;
    }
    emit(
      AuthState(
        aPiState: APiState.error,
        message: response.message,
      ),
    );
  }
}
