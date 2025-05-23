import 'package:bungasari_app/preference/preference.dart';
import 'package:flutter/material.dart';

import '../../../styles/text_style.dart';

class GethelpPage extends StatelessWidget {
  const GethelpPage({super.key});

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
                    'Pusat Bantuan',
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
                SizedBox(height: 60), // Agar konten tidak tertimpa header
                SizedBox(height: 10),
                Text('Forgot Password', style: AppTextStyles.TitlefrBigTitle),
                SizedBox(height: 4),
                Text(
                  'Jika Anda mengalami kendala atau lupa password, silakan hubungi admin kami untuk bantuan lebih lanjut.',
                  style: AppTextStyles.DescfrFinalData,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone, size: 14),
                    SizedBox(width: 7),
                    Text('+62 xxxxxxx'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.mail, size: 14),
                    SizedBox(width: 7),
                    Text('bungasari@gmail.com'),
                  ],
                ),
                SizedBox(height: 20),
            Text('Customer Service', style: AppTextStyles.TitlefrBigTitle),
            SizedBox(height: 4),
            Text(
              'Tim layanan pelanggan kami siap membantu Anda setiap saat. Jangan ragu untuk menghubungi kami jika mengalami kendala atau memiliki pertanyaan seputar layanan kami.',
              style: AppTextStyles.DescfrFinalData,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset('assets/image/Facebook_icon.png', scale: 130,),
                SizedBox(width: 7),
                Text('Bungasari'),
              ],
            ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Image.asset('assets/image/Instagram_icon.png', scale: 300,),
                    SizedBox(width: 7),
                    Text('Bungasari'),
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Image.asset('assets/image/WhatsApp_icon.png', scale: 30,),
                    SizedBox(width: 7),
                    Text('+62 XXX-XXX-XX'),
                  ],
                ),
                SizedBox(height: 50),
                Text('Lainnya', style: AppTextStyles.TitlefrBigTitle),
                SizedBox(height: 10),
                _buildOptionTile('Terms of Us'),
                SizedBox(height: 10),
                _buildOptionTile('Get in Touch With Us', fontFamily: 'SfDisplayPro'),
                SizedBox(height: 10),
                _buildOptionTile('Privacy Policy'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(String title, {String? fontFamily}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 21),
      decoration: BoxDecoration(
        color: AppColor.bgWhite,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontFamily: fontFamily),
          ),
          Icon(Icons.navigate_next_outlined),
        ],
      ),
    );
  }
}
