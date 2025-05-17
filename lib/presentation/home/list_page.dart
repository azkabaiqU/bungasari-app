import 'package:bungasari_app/preference/preference.dart';
import 'package:flutter/material.dart';

import '../../widgets/divider/divider.dart'; // Jika ini digunakan di bagian lain, tetap pertahankan
import '../../styles/text_style.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

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
            padding: EdgeInsets.only( bottom: 20,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 9, bottom: 9),
                  // color: AppColor.bgBlue,
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/image/flowwer.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PT.ubur-ubur ikan ELEl',
                            style: TextStyle(
                              fontFamily: "SfProDisplay",
                              fontSize: 16,
                              color: AppColor.textBlack,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            'Perikanan',
                            style: TextStyle(
                              fontFamily: "SfPro",
                              fontSize: 16,
                              color: AppColor.textGrayV1,
                              height: 1.2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
