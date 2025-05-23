import 'package:bungasari_app/presentation/auth/widgets/register_form.dart';
import 'package:bungasari_app/presentation/connector.dart';
import 'package:bungasari_app/presentation/form/widgets/alert.dart';
import 'package:bungasari_app/presentation/form/widgets/company_field.dart';
import 'package:bungasari_app/presentation/form/widgets/company_uploader.dart';
import 'package:bungasari_app/presentation/form/widgets/next_button.dart';
import 'package:bungasari_app/presentation/form/widgets/pop_up.dart';
import 'package:bungasari_app/presentation/form/widgets/previous_button.dart';
import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:bungasari_app/presentation/profile/pages/profile_page.dart';
import '../../../styles/text_style.dart';
import '../../../preference/input_widget.dart';

import '../../home/page/home_page.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child:
                        Icon(Icons.arrow_back, color: Colors.black, size: 15),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Pengajuan Kolaborasi',
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
          Positioned.fill(
            top: 94,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(3, (index) {
                    double screenWidth = MediaQuery.of(context).size.width;
                    List<String> partTitles = [
                      "Informasi Perusahaan",
                      "Ceritakan tentang Perusahaan Anda",
                      "Informasi Tambahan"
                    ];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: screenWidth * 0.29,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: LinearGradient(
                              colors: _currentPage == index
                                  ? [AppColor.bgBtnBlack, AppColor.bgBtnBlack]
                                  : [
                                      AppColor.bgGrayFrBar,
                                      AppColor.bgGrayFrBar
                                    ],
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          width: screenWidth * 0.28,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              partTitles[index],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SfPro",
                                color: _currentPage == index
                                    ? AppColor.bgBtnBlack
                                    : AppColor.textFrBarTitle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 28, left: 28),
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        PartOne(onNext: _nextPage),
                        PartTwo(onNext: _nextPage, onPrevious: _previousPage),
                        PartThree(
                            onNext: () => ProfilePage,
                            onPrevious: _previousPage),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartOne extends StatelessWidget {
  final VoidCallback onNext;
  PartOne({required this.onNext});

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 44),
          // Number 1 ---------------------------(======= 1.1 Nama Perusahaan ========)
          RegisterForm(
            title: 'Nama Perusahaan',
            hintText: 'Nama Perusahaan Anda',
            controller: nameController,
          ),
          SizedBox(height: 25),

          // Number 2 ---------------------------(======= 1.2 Alamat ========)
          RegisterForm(
            title: 'Alamat Perusahaan',
            hintText: 'Jl. Contoh No. 123, Kota, Provinsi',
            controller: addressController,
          ),
          SizedBox(height: 25),

          // Number 3 ---------------------------(======= 1.3 Email ========)
          RegisterForm(
            title: 'Email Perusahaan',
            hintText: 'example@gmail.com',
            controller: emailController,
          ),
          SizedBox(height: 7),

          //  ---------------------------(======= !!!!! ALERT ========)
          Alert(
            message:
                'Pastikan Email Anda aktif dan dapat diakses. Semua notifikasi dan konfirmasi akan dikirim ke email ini',
          ),
          SizedBox(height: 25),

          // Number 4 ---------------------------(======= 1.4 Nomor Telepon ========)
          RegisterForm(
            title: 'Nomor Telepon',
            hintText: '08XX-XXXX-XXXX',
            controller: phoneController,
          ),
          SizedBox(height: 25),

          NextButton(title: 'Selanjutnya', onPressed: onNext),
        ],
      ),
    );
  }
}

class PartTwo extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  final logoPathController = TextEditingController();
  final businessTypeController = TextEditingController();
  final descriptionController = TextEditingController();
  PartTwo({Key? key, required this.onNext, required this.onPrevious})
      : super(key: key);

  @override
  _PartTwoState createState() => _PartTwoState();
}

class _PartTwoState extends State<PartTwo> {
  File? _selectedImage;
  String? _fileName;
  final TextEditingController _controller = TextEditingController();
  final int _maxLength = 250;
  bool _isOverLimit = false;

  String _truncateFileName(String name, int maxLength) {
    if (name.length > maxLength) {
      List<String> parts = name.split('.');
      String ext = parts.length > 1 ? ".${parts.last}" : "";
      String truncated = name.substring(0, maxLength - ext.length) + "...";
      return truncated + ext;
    }
    return name;
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;

      setState(() {
        _selectedImage = File(returnedImage.path);
        _fileName = returnedImage.name;
      });
    } catch (e) {}
  }

  void _onTextChanged(String value) {
    setState(() {
      if (value.length > _maxLength) {
        _isOverLimit = true;
        _controller.text = value.substring(0, _maxLength);
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      } else {
        _isOverLimit = false;
      }
    });
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 44),
          CompanyUploader(
            title: 'Logo Perusahaan',
            fileName: _fileName,
            selectedImage: _selectedImage,
            onPickImage: _pickImageFromGallery,
            onRemoveImage: _removeImage,
            truncateFileName: _truncateFileName,
          ),
          SizedBox(height: 25),
          RegisterForm(
            title: 'Jenis Usaha',
            hintText: 'Masukkan Kategori Bisnis Anda',
            controller: TextEditingController(),
          ),
          SizedBox(height: 25),
          CompanyField(
            title: 'Jenis Usaha',
            hintText:
                'Ceritakan secara singkat tentang perusahaan Anda, produk yang Anda buat, dan pengalaman dalam industri ini.',
            controller: _controller,
            isOverLimit: _isOverLimit,
            maxLength: _maxLength,
            onTextChanged: _onTextChanged,
          ),
          SizedBox(height: 7),
          Alert(
            message:
                'Deskripsi harus minimal 50 kata agar PT. Bunga Sari dapat memahami bisnis Anda dengan lebih baik.',
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousButton(title: 'Kembali', onPressed: widget.onPrevious),
              SizedBox(width: 10), // Spasi antar tombol
              NextButton(title: 'Selanjutnya', onPressed: widget.onNext),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    ));
  }
}

class PartThree extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final notesController = TextEditingController();
  final attachmentPathController = TextEditingController();

  PartThree({Key? key, required this.onNext, required this.onPrevious})
      : super(key: key);

  @override
  _PartThreeState createState() => _PartThreeState();
}

class _PartThreeState extends State<PartThree> {
  File? _selectedImage;
  String? _fileName;
  final TextEditingController _controller = TextEditingController();
  final int _maxLength = 250;
  bool _isOverLimit = false;

  String _truncateFileName(String name, int maxLength) {
    if (name.length > maxLength) {
      List<String> parts = name.split('.');
      String ext = parts.length > 1 ? ".${parts.last}" : "";
      String truncated = name.substring(0, maxLength - ext.length) + "...";
      return truncated + ext;
    }
    return name;
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;

      setState(() {
        _selectedImage = File(returnedImage.path);
        _fileName = returnedImage.name;
      });
    } catch (e) {
      // Handle error jika perlu
    }
  }

  void _onTextChanged(String value) {
    setState(() {
      if (value.length > _maxLength) {
        _isOverLimit = true;
        _controller.text = value.substring(0, _maxLength);
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      } else {
        _isOverLimit = false;
      }
    });
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            CompanyField(
              title: 'Catatan Tambahan',
              hintText:
                  'Tulis informasi tambahan yang perlu kami ketahui tentang pengajuan Anda (opsional)',
              controller: _controller,
              isOverLimit: _isOverLimit,
              maxLength: _maxLength,
              onTextChanged: _onTextChanged,
            ),
            SizedBox(height: 25),
            CompanyUploader(
              title: 'Lampiran Perusahaan',
              fileName: _fileName,
              selectedImage: _selectedImage,
              onPickImage: _pickImageFromGallery,
              onRemoveImage: _removeImage,
              truncateFileName: _truncateFileName,
            ),
            SizedBox(height: 7),
            Alert(
              message:
                  'Anda dapat mengubah dokumen legalitass seperti SIUP, NIB, atau TDP untuk mempercepat proses verifikasi (opsional).',
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PreviousButton(title: 'Kembali', onPressed: widget.onPrevious),
                SizedBox(width: 10), // Spasi antar tombol
                NextButton(
                    title: 'Kirim',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            true, // Mengizinkan menutup dialog dengan mengetuk area di luar
                        builder: (BuildContext context) {
                          return PopUp();
                        },
                      );
                    }),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


