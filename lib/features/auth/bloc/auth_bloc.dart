import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:equatable/equatable.dart';
import 'package:hh_express/settings/enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState(termsConfirmed: false) ) ;

  void some() {}
}
