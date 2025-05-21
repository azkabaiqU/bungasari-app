import 'package:bloc/bloc.dart';

// part 'register_event.dart';
// part 'register_state.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    // Event handler untuk nama berubah
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    // Event handler untuk email berubah
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    // Event handler untuk password berubah
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    // Event handler untuk konfirmasi password berubah
    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    // Event handler untuk submit register
    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));

      try {
        // Contoh simulasi delay untuk proses register
        await Future.delayed(const Duration(seconds: 2));

        // Contoh validasi sederhana
        if (state.password != state.confirmPassword) {
          emit(state.copyWith(
              isSubmitting: false,
              errorMessage: 'Password dan konfirmasi tidak cocok'));
          return;
        }

        // Jika sukses
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(
            isSubmitting: false, errorMessage: 'Gagal registrasi: $e'));
      }
    });
  }
}
