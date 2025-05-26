import 'package:bloc/bloc.dart';
import 'package:bungasari_app/data/dataresource/auth_remote_dataresource.dart';
import 'package:bungasari_app/data/model/response/auth_response_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/dataresource/auth_local_dataresource.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDataresource authRemoteDataresource;
  final AuthLocalDataresource authLocalDataresource;

  RegisterBloc( this.authRemoteDataresource, this.authLocalDataresource)
      : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());

      final response = await authRemoteDataresource.register(
          name: event.name,
          email: event.email,
          password: event.password,
        );

        response.fold(
              (l) => emit(RegisterFailure(message: l)),
              (r) => emit(RegisterSuccess(authResponseModel: r)),
        );
    });
  }
}

