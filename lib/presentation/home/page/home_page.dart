import 'package:bungasari_app/preference/divider.dart';
import 'package:bungasari_app/presentation/form/pages/form_page.dart';
import 'package:bungasari_app/presentation/home/list_page.dart';
import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';
import 'package:bungasari_app/widgets/navbar.dart';
import '../../../styles/text_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBasic,
      body:
      SingleChildScrollView(
          child: Padding(
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
                    style: AppTextStyles.DescfrFinalData
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
                          style: AppTextStyles.TitlefrBigTitle
                      ),
                      Text(
                        'Silahkan mengisi form untuk pengajuan Collaberasi.',
                          style: AppTextStyles.DescfrFinalData,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Warna background hitam
                            padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FormPage()),
                          ); },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.markunread_mailbox_outlined,
                              color: AppColor.bgBasic,
                              size: 14,
                            ),
                            SizedBox(width: 4,),
                            Text(
                              'Ajukan!',
                              style: TextStyle(
                                fontFamily: "SfPro",
                                fontWeight: FontWeight.w100,
                                fontSize: 14,
                                color: AppColor.bgBasic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                // Status Colaburation
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.bgWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.only(
                      left: 21,
                      bottom: 21,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 17,right: 21 ),
                          child: Column(
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
                                  style: AppTextStyles.DescfrFinalData
                              ),
                              SizedBox(height: 20), // Memberi jarak antar elemen
                              Align(
                                alignment: Alignment.centerRight,
                                child:Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.bgOrange,
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                    ],
                                  ),
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
                        ),

                        Positioned(
                            top: 7,
                            right:6,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                    barrierDismissible: true, // Mengizinkan menutup dialog dengan mengetuk area di luar
                                  builder: (BuildContext context) {
                                    return StatusPopup();
                                  },
                                );
                                print('Tanda tanya diklik!');
                              },
                              child:
                              Container(
                                width: 30,
                                height: 30,
                                // color: AppColor.bgOrange,
                                child: Center(
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      // color: AppColor.bgBlue,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor.textGrayV1,
                                        width: 1,
                                      ),
                                    ),
                                    child:
                                    Center( child:
                                    Text(
                                      '?',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100,color: AppColor.textGrayV1, fontFamily: "SfProDisplay"),
                                    ),),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    )),
                SizedBox(height: 14),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.bgWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 21,
                      bottom: 21,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 17,right: 21 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Siapa yang telah berkolaborasi',
                                  style: AppTextStyles.TitlefrBigTitle
                              ),
                              Text(
                                'Anda dapat melihat siapa saja mitra bisnis yang telah berkolaborasi dalam proyek sebelumnya.',
                                  style: AppTextStyles.DescfrFinalData
                              ),
                              SizedBox(height: 20), // Memberi jarak antar elemen
                              Container( width: double.infinity, child: CustomDivider()),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 7),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    // COLAB1
                                    Container(
                                      margin: EdgeInsets.only(top: 9, bottom: 9),
                                      // color: AppColor.bgBlue,
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              'assets/image/Meiji_logo.png',
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
                                    // COLAB2
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
                                    // COLAB3
                                    Container(
                                      margin: EdgeInsets.only(top: 9, bottom: 9),
                                      // color: AppColor.bgBlue,
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              'assets/image/Meiji_logo.png',
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: 7,
                            right: 6,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return SiapaPopup();
                                  },
                                );
                                print('Tanda tanya diklik!');
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor.textGrayV1,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '?',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: AppColor.textGrayV1,
                                          fontFamily: "SfDisplayPro",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    )),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.bgGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: 21,
                      right: 21,
                      left: 21,
                      bottom: 21,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black, // warna dasar teks
                              ),
                              children: [
                                TextSpan(
                                  text: '344 Perusahaan\n',
                                  style: TextStyle(
                                    fontFamily: "SfDisplayPro",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                TextSpan(
                                  text: 'Yang telah berColaborasi',
                                  style: TextStyle(
                                    fontFamily: "SfDisplayPro",
                                    fontSize: 14,
                                    color: AppColor.textFrGreen,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, // Warna background hitam
                                padding:
                                EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListPage()),
                              ); },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                      fontFamily: "SfPro",
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14,
                                      color: AppColor.textWhite),
                                ),
                              ],
                            ),
                          ),

                        ],

                      ),
                    ) ,// lanjutkan widget di sini
                ),

              ],
            ),
          ),
      ),
      // bottomNavigationBar: CustomTabBar(),

    );

  }
}
// Status Popup
class StatusPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.0), // Padding 10 di setiap sisi
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20), // Padding internal dialog
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Status Kolaborasi',
                style: AppTextStyles.TitlefrBigTitle
            ),
            SizedBox(height: 7),
            Text(
              'Status ini memberi tahu apakah pengajuan kerja sama sedang diproses, disetujui, atau ditolak.',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 15,),

            // DITOLAK
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: AppColor.bgRed,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                ],
              ),
              child: Text(
                'Ditolak',
                style: TextStyle(
                  fontFamily: "SfPro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.textFrRed,
                ),
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Dokumen Anda ditolak. Silakan periksa kembali persyaratan dan unggah ulang jika diperlukan.',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 15),
            // DITERIMA
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: AppColor.bgGreen,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                ],
              ),
              child: Text(
                'Telah Diterima',
                style: TextStyle(
                  fontFamily: "SfPro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.textFrGreen,
                ),
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Dokumen Anda telah disetujui. Anda dapat melanjutkan ke langkah berikutnya.',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 15),
            // DIPROSSES
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: AppColor.bgBlue,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                ],
              ),
              child: Text(
                'Sedang Diproses',
                style: TextStyle(
                  fontFamily: "SfPro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.textFrBlue,
                ),
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Dokumen sedang diproses. Mohon tunggu hingga tim kami meninjau pengajuan Anda.',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 15),
            // DiAJUKAN
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: AppColor.bgOrange,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                ],
              ),
              child: Text(
                'Belum ada Pengajuan',
                style: TextStyle(
                  fontFamily: "SfPro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.textFrOrange,
                ),
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Anda belum melakukan pengajuan. Anda dapat mengajukan dengan mengclick tombol ajukan di Submit Collaboration.',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textGrayV1,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// Siapa Popup
class SiapaPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.0), // Padding 10 di setiap sisi
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20), // Padding internal dialog
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Siapa yang telah berkolaborasi',
              style: TextStyle(
                fontFamily: "SfProDisplay",
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Fitur ini menampilkan daftar perusahaan yang telah menjalin kerja sama dengan PT. Bunga Sari. Anda dapat melihat mitra bisnis yang aktif atau yang telah menyelesaikan kolaborasi sebelumnya.',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 14,
                color: AppColor.textGrayV1,
              ),
            ),

          ],
        ),
      ),
    );
  }
}


