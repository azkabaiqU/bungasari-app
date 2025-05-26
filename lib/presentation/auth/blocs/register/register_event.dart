part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent{
  final String name;
  final String email;
  final String password;

  RegisterButtonPressed({required this.name, required this.email, required this.password});
}