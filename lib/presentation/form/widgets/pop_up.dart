import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/presentation/connector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.0), // Padding 10 di setiap sisi
      backgroundColor: AppColor.bgOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: 20), // Padding internal dialog
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                'assets/image/tandaseru_icon.png',
                width: 16,
                height: 16,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Apakah Anda yakin seluruh data yang diisi sudah benar dan sesuai?',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: "SfProDisplay",
                fontSize: 24,
                color: AppColor.textFrOrange,
                height: 1.2,
              ),
            ),
            Text(
              'Anda memiliki maksimal 3 kesempatan pengisian data dalam sebulan. Pastikan data yang Anda isi sudah benar sebelum dikirim.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textFrOrange,
              ),
            ),
            SizedBox(height: 27),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColor.bgOrange,
                      padding:
                      EdgeInsets.symmetric(horizontal: 37, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColor.textBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Spasi antar tombol
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.black, // Warna background hitam
                      padding:
                      EdgeInsets.symmetric(horizontal: 37, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnectorPage()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontFamily: "SfPro",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColor.textWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}