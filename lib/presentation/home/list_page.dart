import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../preference/color.dart';
import '../../styles/text_style.dart';
import '../../widgets/divider/divider.dart';
import '../../data/model/response/company_response_dataresource.dart';// pastikan path ini sesuai project lu

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Company> companies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/companies')); // ganti ke URL lu
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final List<dynamic> data = decoded['data'];

        setState(() {
          companies = data.map((e) => Company.fromMap(e)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Gagal load data');
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBasic,
      body: Stack(
        children: [
          Positioned(
            left: 18,
            top: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.bgBtnBack,
                        width: 1,
                      ),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.black, size: 15),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Who has Collaborated',
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontSize: 24,
                      color: AppColor.textBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
              itemCount: companies.length,
              separatorBuilder: (_, __) => Divider(color: Colors.grey, thickness: 0.5),
              itemBuilder: (context, index) {
                final company = companies[index];
                return Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/image/flowwer.jpg', // atau ganti dengan image dari API jika ada
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company.name,
                          style: TextStyle(
                            fontFamily: "SfProDisplay",
                            fontSize: 16,
                            color: AppColor.textBlack,
                          ),
                        ),
                        Text(
                          company.businessType,
                          style: TextStyle(
                            fontFamily: "SfPro",
                            fontSize: 16,
                            color: AppColor.textGrayV1,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
