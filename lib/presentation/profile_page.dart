import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';
import '../styles/text_style.dart';
import 'form_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBasic,
      body: SingleChildScrollView(
        child: Padding(
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
                    style: AppTextStyles.TitlefrFinalData,
                  ),
                  Text(
                      'Packaging Sales',
                      style: AppTextStyles.DescfrFinalData
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
                      style: AppTextStyles.TitlefrBigTitle
                  ),
                  Text(
                      'Informasi yang telah anda kirim di Submit Collabration namun tidak semua kami tampilkan',
                      style: AppTextStyles.DescfrFinalData
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Perusahaan', style: AppTextStyles.TitlefrFinalData ,),
                      Text('PT. Akapack Group', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Alamat Perusahaan', style: AppTextStyles.TitlefrFinalData ,),
                      Text('Jl. Kiara Condong 12312', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Email Perusahaan', style: AppTextStyles.TitlefrFinalData ,),
                      Text('Akapack@gmail.com', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Nomer Telepone', style: AppTextStyles.TitlefrFinalData ,),
                      Text('0800808080808', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Logo Perusahaan Anda', style: AppTextStyles.TitlefrFinalData ,),
                      SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.bgBasic, // Masukkan ke dalam BoxDecoration
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.broken_image),
                            SizedBox(width: 5),
                            Text(
                              'logo-anda.png',
                              style: TextStyle(
                                fontFamily: "SfPro",
                                fontSize: 14,
                                color: AppColor.textBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Jenis Usaha', style: AppTextStyles.TitlefrFinalData ,),
                      Text('Pakaging', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Deskripsi Singkat Perusahaan', style: AppTextStyles.TitlefrFinalData ,),
                      Text('AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Catatan Tambahan', style: AppTextStyles.TitlefrFinalData ,),
                      Text('AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.', style: AppTextStyles.DescfrFinalData ,),
                      SizedBox(height: 15,),
                      Text('Lampiran (Opsional)', style: AppTextStyles.TitlefrFinalData ,),
                      SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.bgBasic, // Masukkan ke dalam BoxDecoration
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.broken_image),
                            SizedBox(width: 5),
                            Text(
                              'LampiranRahasiaNegara.pdf',
                              style: TextStyle(
                                fontFamily: "SfPro",
                                fontSize: 14,
                                color: AppColor.textBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
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
                              style: AppTextStyles.TextfrAttention
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
            )
          ],
        ),
      ) ,)

    );
  }
}
