part of 'company_bloc.dart';

@immutable
sealed class CompanyEvent {}

class CompanyButtonPressed extends CompanyEvent {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String logo;
  final String businessType;
  final String description;
  final String notes;
  final String attachment;

  CompanyButtonPressed({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.logo,
    required this.businessType,
    required this.description,
    required this.notes,
    required this.attachment
  });
}