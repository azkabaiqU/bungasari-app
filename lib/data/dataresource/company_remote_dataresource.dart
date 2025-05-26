import 'dart:convert';

import 'package:bungasari_app/data/dataresource/auth_local_dataresource.dart';
import 'package:bungasari_app/data/model/response/company_response_dataresource.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


class CompanyRemoteDataresource{
  // Create
  Future<Either<String, CompanyResponseModel>> create(String name, String address, String email, String phone, String logo, String businessType, String description, String notes, String attachment) async{
    final authData = await AuthLocalDataresource().getAuthData();

    final response = await http.post(
      Uri.parse('http://192.168.236.116:8000/api/create-company'),
      headers: {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${authData.accessToken}'
      },
      body: jsonEncode(<String, String>{
        'name' : name,
        'email': email,
        'address' : address,
        'phone' : phone,
        'logo' : logo,
        'business_type' : businessType,
        'description' : description,
        'notes': notes,
        'attachment': attachment,
      }),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');


    if(response.statusCode == 200 || response.statusCode == 201){
      return Right(CompanyResponseModel.fromJson(response.body));
    }else{
      return left(response.body);
    }
  }
}