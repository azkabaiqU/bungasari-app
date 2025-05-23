import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();
  @override
  List<Object?> get props => [];
}

class CompanyNameChanged extends FormEvent {
  final String name;
  const CompanyNameChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class CompanyAddressChanged extends FormEvent {
  final String address;
  const CompanyAddressChanged(this.address);
  @override
  List<Object?> get props => [address];
}

class CompanyEmailChanged extends FormEvent {
  final String email;
  const CompanyEmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class CompanyPhoneChanged extends FormEvent {
  final String phone;
  const CompanyPhoneChanged(this.phone);
  @override
  List<Object?> get props => [phone];
}

class CompanyLogoChanged extends FormEvent {
  final String logoPath; // bisa jadi path dari file picker
  const CompanyLogoChanged(this.logoPath);
  @override
  List<Object?> get props => [logoPath];
}

class BusinessTypeChanged extends FormEvent {
  final String type;
  const BusinessTypeChanged(this.type);
  @override
  List<Object?> get props => [type];
}

class CompanyDescriptionChanged extends FormEvent {
  final String description;
  const CompanyDescriptionChanged(this.description);
  @override
  List<Object?> get props => [description];
}

class AdditionalNotesChanged extends FormEvent {
  final String notes;
  const AdditionalNotesChanged(this.notes);
  @override
  List<Object?> get props => [notes];
}

class CompanyAttachmentChanged extends FormEvent {
  final String filePath;
  const CompanyAttachmentChanged(this.filePath);
  @override
  List<Object?> get props => [filePath];
}

class FormSubmitted extends FormEvent {}
