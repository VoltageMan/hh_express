part of 'auth_bloc.dart';

class AuthState {
  const AuthState({required this.aPiState, this.message});
  final APiState aPiState;
  final String? message;

  AuthState update(AuthState state) {
    return AuthState(
      aPiState: state.aPiState,
    );
  }
}
