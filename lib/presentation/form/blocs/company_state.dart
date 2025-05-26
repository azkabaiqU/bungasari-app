part of 'company_bloc.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyLoading extends CompanyState {}

final class CompanySuccess extends CompanyState {
  final CompanyResponseModel companyResponseModel;

  CompanySuccess({required this.companyResponseModel});
}

final class CompanyFailure extends CompanyState {
  final String message;

  CompanyFailure({required this.message});
}