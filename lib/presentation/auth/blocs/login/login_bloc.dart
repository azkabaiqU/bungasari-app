import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bungasari_app/data/dataresource/auth_remote_dataresource.dart';
import 'package:bungasari_app/data/model/response/auth_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDataresource authRemoteDataresource;

  LoginBloc(this.authRemoteDataresource) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      final response = await authRemoteDataresource.login(event.email, event.password);

      response.fold(
        (l) => emit(LoginFailure(message: l)),
        (r) => emit(LoginSuccess(authResponseModel: r)),
      );
    });
  }
}
