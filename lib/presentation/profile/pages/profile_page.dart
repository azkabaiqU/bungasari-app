import 'package:bungasari_app/core/core.dart';
import 'package:bungasari_app/presentation/auth/pages/login_page.dart';
import 'package:bungasari_app/presentation/form/widgets/alert.dart';
import 'package:bungasari_app/presentation/home/blocs/logout/logout_bloc.dart';
import 'package:bungasari_app/presentation/profile/widgets/header.dart';
import 'package:bungasari_app/presentation/profile/widgets/list_profile.dart';
import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/text_style.dart';
import '../../form/pages/form_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgBasic,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.all(20), // Tambahkan kurung kurawal setelah Padding
            child: Column(
              children: [
                Header(
                  name: 'PT. Akapack Group',
                  category: 'Packaging Sales',
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
                      Text('Detail Pengajuan Anda',
                          style: AppTextStyles.TitlefrBigTitle),
                      Text(
                          'Informasi yang telah anda kirim di Submit Collabration namun tidak semua kami tampilkan',
                          style: AppTextStyles.DescfrFinalData),
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
                          ListProfile(
                            title: 'Nama Perusahaan',
                            name: 'PT. Akapack Group',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListProfile(
                            title: 'Alamat Perusahaan',
                            name: 'Jl. Kiaracondong, 12312',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListProfile(
                            title: 'Email Perusahaan',
                            name: 'ackapackgroup.com',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListProfile(
                            title: 'Nomor Telepon',
                            name: '08123456789',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Logo Perusahaan Anda',
                            style: AppTextStyles.TitlefrFinalData,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor
                                  .bgBasic, // Masukkan ke dalam BoxDecoration
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 15),
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
                          SizedBox(
                            height: 15,
                          ),
                          ListProfile(
                            title: 'Jenis Usaha',
                            name: 'Packaging Sales',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListProfile(
                            title: 'Deskripsi Singkat Perusahaan',
                            name:
                                'AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListProfile(
                            title: 'Catatan Tambahan',
                            name:
                                'AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.AWe are PT. Akapack Artisan in Bandung which has been producing packaging since 2000.',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Lampiran (Opsional)',
                            style: AppTextStyles.TitlefrFinalData,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor
                                  .bgBasic, // Masukkan ke dalam BoxDecoration
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 15),
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
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Alert(
                        message:
                            'Anda hanya dapat mengirim ulang pengajuan maksimal 3 kali dalam sebulan. Pastikan semua data sudah benar sebelum mengirim ulang.',
                      ),
                      SizedBox(height: 7),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.black, // Warna background hitam
                            padding: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FormPage()),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.markunread_mailbox_outlined,
                              color: AppColor.bgBasic,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
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
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<LogoutBloc, LogoutState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      context.pushAndRemoveUntil(
                          const LoginPage(), (route) => false);
                    }
                    if (state is LogoutFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LogoutLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return TextButton(
                      onPressed: () {
                        context.read<LogoutBloc>().add(LogoutButtonPrassed());
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
