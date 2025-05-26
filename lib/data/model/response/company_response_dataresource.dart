import 'package:meta/meta.dart';
import 'dart:convert';

class CompanyResponseModel {
  final String message;
  final Data data;

  CompanyResponseModel({
    required this.message,
    required this.data,
  });

  factory CompanyResponseModel.fromJson(String str) => CompanyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyResponseModel.fromMap(Map<String, dynamic> json) => CompanyResponseModel(
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
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

  Data({
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

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
