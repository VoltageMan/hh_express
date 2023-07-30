part of 'auth_bloc.dart';

class AuthState {
  const AuthState({required this.apiState, this.message});
  final APIState apiState;
  final String? message;
}
