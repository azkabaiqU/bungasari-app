import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBasic,
      body: Padding(
        padding: EdgeInsets.all(20), // Tambahkan kurung kurawal setelah Padding
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.bgWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.only(
                top: 17,
                right: 21,
                left: 21,
                bottom: 21,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PT. Akapack Group',
                    style: TextStyle(
                      fontFamily: "SfPro",
                      // fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColor.textBlack,
                    ),
                  ),
                  Text(
                    'Packaging Sales',
                    style: TextStyle(
                      fontFamily: "SfPro",
                      fontSize: 14,
                      color: AppColor.textGrayV1,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.bgWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.only(
                top: 17,
                right: 21,
                left: 21,
                bottom: 21,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Pengajuan Anda',
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontSize: 24,
                      color: AppColor.textBlack,
                    ),
                  ),
                  Text(
                    'Informasi yang telah anda kirim di Submit Collabration namun tidak semua kami tampilkan',
                    style: TextStyle(
                      fontFamily: "SfPro",
                      fontSize: 14,
                      color: AppColor.textGrayV1,
                    ),
                  ),
                  SizedBox(height: 19),
                  // height: MediaQuery.of(context).size.height * 0.05,
                  Divider(
                    color: AppColor.bgGrayFrBar,
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: 19),
                  // isi dari Detail Pengajuan ---- * ----
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.bgOrange,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    padding: EdgeInsets.all(17),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          // Tambahkan padding di sini, bukan di ElevatedButton
                          padding: EdgeInsets.only(right: 10),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                padding:
                                    EdgeInsets.zero, // Hapus padding di sini
                              ),
                              child: Image.asset(
                                'assets/image/tandaseru_icon.png',
                                width: 16,
                                height: 16,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Anda hanya dapat mengirim ulang pengajuan maksimal 3 kali dalam sebulan. Pastikan semua data sudah benar sebelum mengirim ulang.',
                            style: TextStyle(
                              fontFamily: "SfPro",
                              fontSize: 14,
                              color: AppColor.textFrOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Warna background hitam
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ajukan!',
                          style: TextStyle(
                              fontFamily: "SfPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColor.textWhite),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
