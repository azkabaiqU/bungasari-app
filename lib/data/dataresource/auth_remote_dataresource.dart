import 'dart:convert';

import 'package:bungasari_app/data/dataresource/auth_local_dataresource.dart';
import 'package:bungasari_app/data/model/response/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataresource{

  // Login
  Future<Either<String, AuthResponseModel>> login(String email, String password) async{
    final response = await http.post(
      Uri.parse('http://192.168.236.116:8000/api/login'),
      headers: {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json'
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password' : password,
    }),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');


    if(response.statusCode == 200 || response.statusCode == 201){
        return Right(AuthResponseModel.fromJson(response.body));
    }else{
      return left(response.body);
    }
  }

  // Logout
  Future<Either<String, String>> logout() async{
    final authData = await AuthLocalDataresource().getAuthData();

    final response = await http.post(
      Uri.parse('http://192.168.236.116:8000/api/logout'),
      headers: <String, String>{
        'Content-Type' : 'application/json',
        'Accept': 'application/json',
        'Authorization' : 'Bearer ${authData.accessToken}'
      },
    );

    if(response.statusCode == 200){
      AuthLocalDataresource().removeAuthData();
      return Right(response.body);
    }else{
      return left(response.body);
    }


  }

  // Register

  Future<Either<String, AuthResponseModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('http://192.168.236.116:8000/api/register'),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal register: ${response.body}');
    }
  }

}