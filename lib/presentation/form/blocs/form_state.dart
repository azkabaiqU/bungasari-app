import 'package:equatable/equatable.dart';

class FormState extends Equatable {
  final String name;
  final String address;
  final String email;
  final String phone;
  final String logoPath;
  final String businessType;
  final String description;
  final String notes;
  final String attachmentPath;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const FormState({
    this.name = '',
    this.address = '',
    this.email = '',
    this.phone = '',
    this.logoPath = '',
    this.businessType = '',
    this.description = '',
    this.notes = '',
    this.attachmentPath = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  FormState copyWith({
    String? name,
    String? address,
    String? email,
    String? phone,
    String? logoPath,
    String? businessType,
    String? description,
    String? notes,
    String? attachmentPath,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return FormState(
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      logoPath: logoPath ?? this.logoPath,
      businessType: businessType ?? this.businessType,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      attachmentPath: attachmentPath ?? this.attachmentPath,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    name,
    address,
    email,
    phone,
    logoPath,
    businessType,
    description,
    notes,
    attachmentPath,
    isSubmitting,
    isSuccess,
    errorMessage,
  ];
}
