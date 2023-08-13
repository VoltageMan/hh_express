part of 'auth_bloc.dart';

class AuthState {
  const AuthState(
      {required this.apiState, required this.termsConfirmed, this.message});
  final APIState apiState;
  final String? message;
  final bool termsConfirmed;
}
