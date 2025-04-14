import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBasic,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image/bungasari_logo_1x.png',
                  width: 18,
                ),
                SizedBox(width: 4.4),
                Text('Bungasari',
                    style: TextStyle(
                        fontFamily: "SfPro",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.textBlack))
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Welcome to\nBungasari App!',
              style: TextStyle(
                  height: 1.2,
                  fontFamily: "SfProDisplay",
                  fontSize: 32,
                  color: AppColor.textBlack),
            ),
            SizedBox(height: 6),
            Text(
              'Menggunakan teknologi paling canggih dan tenaga ahli berpengalaman untuk mengolah gandum terbaik menjadi tepung gandum berkualitas tinggi. Produk Kami.',
              style: TextStyle(
                  fontFamily: "SfPro",
                  fontSize: 14,
                  color: AppColor.textGrayV1),
            ),
            SizedBox(height: 42),
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
                    'Pengajuan Kolaborasi',
                    style: TextStyle(
                        fontFamily: "SfProDisplay",
                        fontSize: 24,
                        color: AppColor.textBlack),
                  ),
                  Text(
                    'Silahkan mengisi form untuk pengajuan Collaberasi.',
                    style: TextStyle(
                        fontFamily: "SfPro",
                        fontSize: 14,
                        color: AppColor.textGrayV1),
                  ),
                  SizedBox(height: 20),
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status Kolaborasi',
                          style: TextStyle(
                            fontFamily: "SfProDisplay",
                            fontSize: 24,
                            color: AppColor.textBlack,
                          ),
                        ),
                        Text(
                          'Status ini memberi tahu apakah pengajuan kerja sama sedang diproses, disetujui, atau ditolak.',
                          style: TextStyle(
                            fontFamily: "SfPro",
                            fontSize: 14,
                            color: AppColor.textGrayV1,
                          ),
                        ),
                        SizedBox(height: 20), // Memberi jarak antar elemen
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.bgOrange,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Belum ada pengajukan',
                              style: TextStyle(
                                fontFamily: "SfPro",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.textFrOrange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: -10,
                      right: 0,
                      child: Text(
                        '?',
                        style:
                            TextStyle(fontSize: 20, color: AppColor.textBlack),
                      ),
                    ),
                  ],
                )),
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Siapa yang telah berkolaborasi',
                          style: TextStyle(
                            fontFamily: "SfProDisplay",
                            fontSize: 24,
                            color: AppColor.textBlack,
                          ),
                        ),
                        Text(
                          'Anda dapat melihat siapa saja mitra bisnis yang telah berkolaborasi dalam proyek sebelumnya.',
                          style: TextStyle(
                            fontFamily: "SfPro",
                            fontSize: 14,
                            color: AppColor.textGrayV1,
                          ),
                        ),
                        SizedBox(height: 20), // Memberi jarak antar elemen
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // Warna latar belakang container
                            border: Border(
                              top: BorderSide(
                                color: AppColor.bgGrayFrBar,
                                // Warna border atas
                                width: 1, // Ketebalan border
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/image/Meiji_logo.png',
                                    width: 40,
                                    height: 40,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: -10,
                      right: 0,
                      child: Text(
                        '?',
                        style:
                            TextStyle(fontSize: 20, color: AppColor.textBlack),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
