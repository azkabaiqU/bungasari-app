import 'package:meta/meta.dart';
import 'dart:convert';

class CompanyResponseModel {
  final List<Company> data;

  CompanyResponseModel({required this.data});

  factory CompanyResponseModel.fromJson(String str) =>
      CompanyResponseModel.fromMap(json.decode(str));

  factory CompanyResponseModel.fromMap(Map<String, dynamic> json) =>
      CompanyResponseModel(
        data: List<Company>.from(json["data"].map((x) => Company.fromMap(x))),
      );
}

class Company {
  final int userId;
  final String name;
  final String address;
  final String email;
  final String phone;
  final String businessType;
  final String description;
  final String notes;
  final String attachment;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Company({
    required this.userId,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.businessType,
    required this.description,
    required this.notes,
    required this.attachment,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
    userId: json["user_id"],
    name: json["name"],
    address: json["address"],
    email: json["email"],
    phone: json["phone"],
    businessType: json["business_type"],
    description: json["description"],
    notes: json["notes"],
    attachment: json["attachment"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "name": name,
    "address": address,
    "email": email,
    "phone": phone,
    "business_type": businessType,
    "description": description,
    "notes": notes,
    "attachment": attachment,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
