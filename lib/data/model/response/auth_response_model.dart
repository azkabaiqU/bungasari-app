
import 'dart:convert';

class AuthResponseModel {
  final String massage;
  final String accessToken;
  final User user;

  AuthResponseModel({
    required this.massage,
    required this.accessToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
    massage: json["massage"],
    accessToken: json["access_token"],
    user: User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "massage": massage,
    "access_token": accessToken,
    "user": user.toMap(),
  };
}

class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final dynamic photo;
  final String position;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.photo,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    photo: json["photo"],
    position: json["position"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "role": role,
    "photo": photo,
    "position": position,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
