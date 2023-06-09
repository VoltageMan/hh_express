part of 'auth_bloc.dart';

class AuthState {
  const AuthState({
    required this.termsConfirmed,
    this.state = APiState.init,
  });
  final bool termsConfirmed;
  final APiState state;

  AuthState update(AuthState state) {
    return AuthState(
      termsConfirmed: state.termsConfirmed,
      state: state.state,
    );
  }
}
