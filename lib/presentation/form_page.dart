import 'package:bungasari_app/presentation/connector.dart';
import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:bungasari_app/presentation/profile_page.dart';
import '../styles/text_style.dart';
import '../widgets/buttons/input_widget.dart';

import '../presentation/home/page/home_page.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void  _nextPage() {
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
                        PartThree(onNext: () => ProfilePage, onPrevious: _previousPage),
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

  const PartOne({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            // Number 1 ---------------------------(======= 1.1Nama Perusahaan ========)
            Text(
              'Nama Perusahaan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            TextField(
              decoration: InputDecoration(
                hintText: "Nama Perusahaan anda",
                hintStyle: AppTextStyles.TextfrHint,

                border: OutlineInputBorder(),
                enabledBorder: inputBorderStyle,
                focusedBorder: focusedBorderStyle,
                errorBorder: errorBorderStyle,
                focusedErrorBorder: errorBorderStyle,
              ),
            ),
            SizedBox(height: 25),

            // Number 2 ---------------------------(======= 1.2 Alamat ========)
            Text(
              'Alamat Perusahaan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            TextField(
              decoration: InputDecoration(
                hintText: "Jl. Contoh No. 123, Kota, Provinsi",
                hintStyle: AppTextStyles.TextfrHint,

                border: OutlineInputBorder(),
                enabledBorder: inputBorderStyle,
                focusedBorder: focusedBorderStyle,
                errorBorder: errorBorderStyle,
                focusedErrorBorder: errorBorderStyle,
              ),
            ),
            SizedBox(height: 25),

            // Number 3 ---------------------------(======= 1.3 Email ========)
            Text(
              'Email Perusahaan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            TextField(
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                hintStyle: AppTextStyles.TextfrHint,

                border: OutlineInputBorder(),
                enabledBorder: inputBorderStyle,
                focusedBorder: focusedBorderStyle,
                errorBorder: errorBorderStyle,
                focusedErrorBorder: errorBorderStyle,
              ),
            ),
            SizedBox(height: 7),

            //  ---------------------------(======= !!!!! ALERT ========)
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
                          padding: EdgeInsets.zero,
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
                      'Pastikan email Anda aktif dan dapat diakses. Semua notifikasi dan konfirmasi akan dikirim ke email ini.',
                        style: AppTextStyles.TextfrAttention
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            // Number 4 ---------------------------(======= 1.4 Nomor Telepon ========)
            Text(
              'Nomor Telephone',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "08XX-XXXX-XXXX",
                hintStyle: AppTextStyles.TextfrHint,

                border: OutlineInputBorder(),
                enabledBorder: inputBorderStyle,
                focusedBorder: focusedBorderStyle,
                errorBorder: errorBorderStyle,
                focusedErrorBorder: errorBorderStyle,
              ),
            ),

            SizedBox(height: 25),
            Container(
              width: double.infinity,
              alignment: AlignmentDirectional.centerEnd,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: onNext,
                child: Text(
                  'Selanjutnya',
                  style: TextStyle(
                    fontFamily: "SfPro",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.textWhite,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }
}


class PartTwo extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const PartTwo({Key? key, required this.onNext, required this.onPrevious}) : super(key: key);

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
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;

      setState(() {
        _selectedImage = File(returnedImage.path);
        _fileName = returnedImage.name;
      });
    } catch (e) {

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
    return
      Container(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            Text(
              'Logo Perusahaan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            Column(
              children: [
                if (_selectedImage == null)
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 0.5,
                    dashPattern: [10, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(7),
                    child : MaterialButton(
                      onPressed: _pickImageFromGallery,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.bgGrayFrImgInpt,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/download_icon.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Upload Your\n Document Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.bgGrayV2,
                                fontSize: 14,
                                fontFamily: "SfProDisplay",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_fileName != null)
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 0.5,
                    dashPattern: [10, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(7),
                    child: MaterialButton(
                      onPressed: _pickImageFromGallery,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 20, left: 20),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.bgGrayFrImgInpt,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _truncateFileName(_fileName!, 30),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.bgGrayV2,
                                fontSize: 14,
                                fontFamily: "SfPro",
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: _removeImage,
                              child: Icon(Icons.close, color: AppColor.textGrayV2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Jenis Usaha',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Masukan kategori bisnis Anda",
                hintStyle: AppTextStyles.TextfrHint,

                border: OutlineInputBorder(),
                enabledBorder: inputBorderStyle,
                focusedBorder: focusedBorderStyle,
                errorBorder: errorBorderStyle,
                focusedErrorBorder: errorBorderStyle,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Deskripsi Singkat Perusahaan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            Container(
              height: 206,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: _isOverLimit ? Colors.red : AppColor.textGrayV2,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLines: null, // biar bisa multiline tanpa batas
                      expands: true, // ini penting biar TextField ngisi tinggi parent
                      textAlignVertical: TextAlignVertical.top, // biar nulisnya dari atas
                      onChanged: _onTextChanged,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Ceritakan secara singkat tentang perusahaan Anda, produk yang Anda buat, dan pengalaman dalam industri ini.",
                        hintStyle: AppTextStyles.TextfrHint,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${_controller.text.length} / $_maxLength Kata",
                    style: TextStyle(
                      color: _isOverLimit ? Colors.red : AppColor.textGrayV2,
                    ),
                  ),
                ],
              ),
            ),
            if (_isOverLimit)
              const Column(
                children: [
                  SizedBox(height: 2),
                  Text(
                    "Anda melewati batas kata.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontFamily: "SfPro",
                    ),
                  ),
                ],
              ),
            SizedBox(height: 7),
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
                          padding: EdgeInsets.zero,
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
                      'Deskripsi harus minimal 50 kata agar PT. Bunga Sari dapat memahami bisnis Anda dengan lebih baik.',
                        style: AppTextStyles.TextfrAttention
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: widget.onPrevious,
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontFamily: "SfPro",
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
                      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: widget.onNext,
                    child: Text(
                      'Selanjutnya',
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
            SizedBox(height: 50),
          ],
        ),
        )
      );

  }
}
class PartThree extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const PartThree({Key? key, required this.onNext, required this.onPrevious}) : super(key: key);

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
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
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
            Text(
              'Catatan Tambahan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            Container(
              height: 206,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: _isOverLimit ? Colors.red : AppColor.textGrayV2,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: _onTextChanged,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tulis informasi tambahan yang perlu kami ketahui tentang pengajuan Anda (opsional).",
                        hintStyle: AppTextStyles.TextfrHint,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${_controller.text.length} / $_maxLength Kata",
                    style: TextStyle(
                      color: _isOverLimit ? Colors.red : AppColor.textGrayV2,
                    ),
                  ),
                ],
              ),
            ),
            if (_isOverLimit)
              const Column(
                children: [
                  SizedBox(height: 2),
                  Text(
                    "Anda melewati batas kata.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontFamily: "SfPro",
                    ),
                  ),
                ],
              ),
            SizedBox(height: 25),
            Text(
              'Lampiran Perusahaan',
              style: TextStyle(
                fontFamily: "SfPro",
                fontSize: 16,
                color: AppColor.textGrayV1,
              ),
            ),
            SizedBox(height: 7),
            Column(
              children: [
                if (_selectedImage == null)
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 0.5,
                    dashPattern: [10, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(7),
                    child : MaterialButton(
                      onPressed: _pickImageFromGallery,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.bgGrayFrImgInpt,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/download_icon.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Upload Your\n Document Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.bgGrayV2,
                                fontSize: 14,
                                fontFamily: "SfProDisplay",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_fileName != null)
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 0.5,
                    dashPattern: [10, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(7),
                    child: MaterialButton(
                      onPressed: _pickImageFromGallery,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 20, left: 20),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.bgGrayFrImgInpt,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _truncateFileName(_fileName!, 30),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.bgGrayV2,
                                fontSize: 14,
                                fontFamily: "SfPro",
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: _removeImage,
                              child: Icon(Icons.close, color: AppColor.textGrayV2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 7),
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
                          padding: EdgeInsets.zero,
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
                      'Anda dapat mengunggah dokumen legalitas seperti SIUP, NIB, atau TDP untuk mempercepat proses verifikasi (Opsional)."',
                        style: AppTextStyles.TextfrAttention
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: widget.onPrevious,
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontFamily: "SfPro",
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
                      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true, // Mengizinkan menutup dialog dengan mengetuk area di luar
                        builder: (BuildContext context) {
                          return KirimPopup();
                        },
                      );
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                      //     transitionDuration: Duration.zero, // tanpa animasi
                      //     reverseTransitionDuration: Duration.zero,
                      //   ),
                      // );
                    },
                    child: Text(
                      'Kirim',
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
            SizedBox(height: 50),


          ],
        ),
      ),
    );
  }
}

class KirimPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.0), // Padding 10 di setiap sisi
      backgroundColor: AppColor.bgOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20), // Padding internal dialog
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child:
              Image.asset(
                'assets/image/tandaseru_icon.png',
                width: 16,
                height: 16,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10,),
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
                      padding: EdgeInsets.symmetric(horizontal: 37, vertical: 17),
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
                      padding: EdgeInsets.symmetric(horizontal: 37, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => ConnectorPage()),
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