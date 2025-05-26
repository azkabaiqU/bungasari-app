part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthResponseModel authResponseModel;

  RegisterSuccess({required this.authResponseModel});
}

final class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure({required this.message});
}