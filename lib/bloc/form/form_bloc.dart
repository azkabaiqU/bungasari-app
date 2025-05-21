import 'package:bloc/bloc.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState()) {
    on<CompanyNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<CompanyAddressChanged>((event, emit) {
      emit(state.copyWith(address: event.address));
    });

    on<CompanyEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<CompanyPhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<CompanyLogoChanged>((event, emit) {
      emit(state.copyWith(logoPath: event.logoPath));
    });

    on<BusinessTypeChanged>((event, emit) {
      emit(state.copyWith(businessType: event.type));
    });

    on<CompanyDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<AdditionalNotesChanged>((event, emit) {
      emit(state.copyWith(notes: event.notes));
    });

    on<CompanyAttachmentChanged>((event, emit) {
      emit(state.copyWith(attachmentPath: event.filePath));
    });

    on<FormSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));

      await Future.delayed(const Duration(seconds: 2));

      if (state.description.length < 500 || state.description.length > 1000) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Deskripsi harus 500–1000 kata.',
        ));
        return;
      }

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}
