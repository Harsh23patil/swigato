import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swigato/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp(
        UserSignUpParam(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      res.fold((failure) => emit(AuthFailure(failure.message)),
          (uid) => emit(AuthSuccess(uid)));
    });
  }
}
