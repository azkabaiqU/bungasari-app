import 'package:bloc/bloc.dart';
import 'package:bungasari_app/data/dataresource/auth_remote_dataresource.dart';
import 'package:meta/meta.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataresource authRemoteDataresource;
  LogoutBloc({required this.authRemoteDataresource}) : super(LogoutInitial()) {
    on<LogoutButtonPrassed>((event, emit) async {
      emit(LogoutLoading());

      final response = await authRemoteDataresource.logout();

      response.fold(
          (l) => emit(LogoutFailure(message: l)),
          (r) => emit(LogoutSuccess()),
      );
    });
  }
}
