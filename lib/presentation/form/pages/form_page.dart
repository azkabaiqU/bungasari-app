  import 'dart:convert';
  import 'dart:io';
  import 'package:file_picker/file_picker.dart';
  import 'package:flutter/material.dart';
  import 'package:image_picker/image_picker.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  
  import 'package:bungasari_app/data/dataresource/auth_local_dataresource.dart';
  import 'package:bungasari_app/presentation/auth/widgets/register_form.dart';
  import 'package:bungasari_app/presentation/form/widgets/alert.dart';
  import 'package:bungasari_app/presentation/form/widgets/company_field.dart';
  import 'package:bungasari_app/presentation/form/widgets/company_uploader.dart';
  import 'package:bungasari_app/presentation/form/widgets/next_button.dart';
  import 'package:bungasari_app/presentation/form/widgets/previous_button.dart';
  import 'package:bungasari_app/presentation/profile/pages/profile_page.dart';
  
  import '../../../preference/color.dart';
  import '../../../styles/text_style.dart';
  import '../blocs/company_bloc.dart';
  
  class FormPage extends StatefulWidget {
    @override
    _FormPageState createState() => _FormPageState();
  }
  
  class _FormPageState extends State<FormPage> {
    final PageController _pageController = PageController();
    int _currentPage = 0;
  
    // Controllers
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final addressController = TextEditingController();
    final phoneController = TextEditingController();
    final businessTypeController = TextEditingController();
    final descriptionController = TextEditingController();
    final notesController = TextEditingController();
    final logoFile = ValueNotifier<File?>(null);
    final attachmentFile = ValueNotifier<File?>(null);
  
    void _nextPage() {
      if (_currentPage < 2) {
        setState(() => _currentPage++);
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  
    void _previousPage() {
      if (_currentPage > 0) {
        setState(() => _currentPage--);
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  
    bool isValidEmail(String email) {
      final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      return regex.hasMatch(email);
    }
  
    @override
    Widget build(BuildContext context) {
      List<String> partTitles = [
        "Informasi Perusahaan",
        "Ceritakan tentang Perusahaan Anda",
        "Informasi Tambahan"
      ];
  
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 18,
              top: 15,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.bgBtnBack, width: 1),
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.black, size: 15),
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
                  // Step bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(3, (index) {
                      double screenWidth = MediaQuery.of(context).size.width;
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: screenWidth * 0.29,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: _currentPage == index
                                  ? AppColor.bgBtnBlack
                                  : AppColor.bgGrayFrBar,
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
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          PartOne(
                            onNext: _nextPage,
                            nameController: nameController,
                            addressController: addressController,
                            emailController: emailController,
                            phoneController: phoneController,
                          ),
                          PartTwo(
                            onNext: _nextPage,
                            onPrevious: _previousPage,
                            logoFile: logoFile,
                            businessTypeController: businessTypeController,
                            descriptionController: descriptionController,
                          ),
                          PartThree(
                            onNext: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => ProfilePage()),
                              );
                            },
                            onPrevious: _previousPage,
                            notesController: notesController,
                            attachmentFile: attachmentFile,
                            nameController: nameController,
                            emailController: emailController,
                            addressController: addressController,
                            businessTypeController: businessTypeController,
                            descriptionController: descriptionController,
                            phoneController: phoneController,
                            logoFile: logoFile,
                            isValidEmail: isValidEmail,
                          ),
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
  
  // ====================== PART ONE ======================
  class PartOne extends StatelessWidget {
    final VoidCallback onNext;
    final TextEditingController nameController;
    final TextEditingController addressController;
    final TextEditingController emailController;
    final TextEditingController phoneController;
  
    PartOne({
      required this.onNext,
      required this.nameController,
      required this.addressController,
      required this.emailController,
      required this.phoneController,
    });
  
    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            RegisterForm(
              title: 'Nama Perusahaan',
              hintText: 'Nama Perusahaan Anda',
              controller: nameController,
            ),
            SizedBox(height: 25),
            RegisterForm(
              title: 'Alamat Perusahaan',
              hintText: 'Jl. Contoh No. 123, Kota, Provinsi',
              controller: addressController,
            ),
            SizedBox(height: 25),
            RegisterForm(
              title: 'Email Perusahaan',
              hintText: 'example@gmail.com',
              controller: emailController,
            ),
            SizedBox(height: 7),
            Alert(
              message: 'Pastikan Email Anda aktif dan dapat diakses.',
            ),
            SizedBox(height: 25),
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
  
  // ====================== PART TWO ======================
  class PartTwo extends StatefulWidget {
    final VoidCallback onNext;
    final VoidCallback onPrevious;
    final ValueNotifier<File?> logoFile;
    final TextEditingController businessTypeController;
    final TextEditingController descriptionController;
  
    PartTwo({
      required this.onNext,
      required this.onPrevious,
      required this.logoFile,
      required this.businessTypeController,
      required this.descriptionController,
    });
  
    @override
    _PartTwoState createState() => _PartTwoState();
  }
  
  class _PartTwoState extends State<PartTwo> {
    File? _selectedImage;
    String? _fileName;
    final _maxLength = 250;
    bool _isOverLimit = false;
  
    @override
    void initState() {
      super.initState();
      _selectedImage = widget.logoFile.value;
      if (_selectedImage != null) {
        _fileName = _selectedImage!.path.split('/').last;
      }
    }
  
    Future<void> _pickImage() async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
          widget.logoFile.value = _selectedImage; // Update ValueNotifier
          _fileName = image.name;
        });
      }
    }
  
    void _removeImage() {
      setState(() {
        _selectedImage = null;
        _fileName = null;
        widget.logoFile.value = null; // Clear ValueNotifier
      });
    }
  
    @override
    Widget build(BuildContext context) {
      final TextEditingController logoFile = TextEditingController();
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            CompanyUploader(
              controller: logoFile,
              title: 'Logo Perusahaan',
              fileName: _fileName,
              selectedImage: _selectedImage,
              onPickImage: _pickImage,
              onRemoveImage: _removeImage,
              truncateFileName: (name, len) =>
              name.length > len ? name.substring(0, len) + "..." : name,
            ),
            SizedBox(height: 25),
            RegisterForm(
              title: 'Jenis Usaha',
              hintText: 'Masukkan Kategori Bisnis Anda',
              controller: widget.businessTypeController,
            ),
            SizedBox(height: 25),
            CompanyField(
              title: 'Deskripsi Usaha',
              hintText: 'Jelaskan produk dan pengalaman perusahaan Anda.',
              controller: widget.descriptionController,
              maxLength: _maxLength,
              isOverLimit: _isOverLimit,
              onTextChanged: (value) {
                setState(() {
                  _isOverLimit = value.length > _maxLength;
                  if (_isOverLimit) {
                    widget.descriptionController.text = value.substring(0, _maxLength);
                    widget.descriptionController.selection =
                        TextSelection.collapsed(offset: _maxLength);
                  }
                });
              },
            ),
            SizedBox(height: 7),
            Alert(message: 'Deskripsi harus minimal 50 kata.'),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PreviousButton(title: 'Sebelumnya', onPressed: widget.onPrevious),
                NextButton(title: 'Selanjutnya', onPressed: widget.onNext),
              ],
            ),
          ],
        ),
      );
    }
  }
  
  // ====================== PART THREE ======================
  class PartThree extends StatefulWidget {
    final VoidCallback onNext;
    final VoidCallback onPrevious;
    final TextEditingController notesController;
    final ValueNotifier<File?> attachmentFile;
    final TextEditingController nameController;
    final TextEditingController emailController;
    final TextEditingController addressController;
    final TextEditingController businessTypeController;
    final TextEditingController descriptionController;
    final TextEditingController phoneController;
    final ValueNotifier<File?> logoFile;
    final bool Function(String) isValidEmail;
  
    PartThree({
      required this.onNext,
      required this.onPrevious,
      required this.notesController,
      required this.attachmentFile,
      required this.nameController,
      required this.emailController,
      required this.addressController,
      required this.businessTypeController,
      required this.descriptionController,
      required this.phoneController,
      required this.logoFile,
      required this.isValidEmail,
    });
  
    @override
    _PartThreeState createState() => _PartThreeState();
  }
  
  class _PartThreeState extends State<PartThree> {
    File? _selectedFile;
    String? _fileName;
  
    @override
    void initState() {
      super.initState();
      _selectedFile = widget.attachmentFile.value;
      if (_selectedFile != null) {
        _fileName = _selectedFile!.path.split('/').last;
      }
    }
  
    Future<void> _pickFile() async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );
      if (result != null && result.files.first.path != null) {
        setState(() {
          _selectedFile = File(result.files.first.path!);
          widget.attachmentFile.value = _selectedFile; // Update ValueNotifier
          _fileName = result.files.first.name;
        });
      }
    }
  
    void _removeFile() {
      setState(() {
        _selectedFile = null;
        widget.attachmentFile.value = null; // Clear ValueNotifier
        _fileName = null;
      });
    }
  
    String truncateFileName(String name, int maxLength) {
      return name.length > maxLength
          ? '${name.substring(0, maxLength)}...'
          : name;
    }
  
    @override
    Widget build(BuildContext context) {
      final TextEditingController attachmentFile = TextEditingController();
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            RegisterForm(
              title: 'Catatan Tambahan',
              hintText: 'Tambahkan hal lain yang perlu diketahui',
              controller: widget.notesController,
            ),
            SizedBox(height: 25),
            CompanyUploader(
              controller: attachmentFile,
              title: 'Lampiran (Opsional)',
              fileName: _fileName,
              selectedImage: _selectedFile,
              onPickImage: _pickFile,
              onRemoveImage: _removeFile,
              truncateFileName: truncateFileName,
            ),
            SizedBox(height: 7),
            Alert(
              message:
              'Anda dapat mengubah dokumen legalitas seperti SIUP, NIB, atau TDP untuk mempercepat proses verifikasi (opsional).',
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PreviousButton(title: 'Sebelumnya', onPressed: widget.onPrevious),
                SizedBox(width: 10,),
                BlocConsumer<CompanyBloc, CompanyState>(
                  listener: (context, state) {
                    if (state is CompanySuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    }
                    if (state is CompanyFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CompanyLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return NextButton(onPressed: () {
                      // Validasi input
                      if (widget.nameController.text.isEmpty ||
                          widget.emailController.text.isEmpty ||
                          widget.addressController.text.isEmpty ||
                          widget.phoneController.text.isEmpty ||
                          widget.businessTypeController.text.isEmpty ||
                          widget.descriptionController.text.isEmpty ||
                          widget.notesController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Semua field harus diisi!')),
                        );
                        return;
                      }
  
                      // Validasi email
                      if (!widget.isValidEmail(widget.emailController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Email tidak valid!')),
                        );
                        return;
                      }
  
                      // Validasi logo
                      if (widget.logoFile.value != null) {
                        String logoPath = widget.logoFile.value!.path.toLowerCase();
                        if (!['.jpeg', '.png', '.jpg', '.gif', '.svg'].any((ext) => logoPath.endsWith(ext))) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logo harus berupa gambar (jpeg, png, jpg, gif, svg)!')),
                          );
                          return;
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Logo harus diisi!')),
                        );
                        return;
                      }
  
                      // Validasi lampiran (jika ada)
                      if (widget.attachmentFile.value != null) {
                        String attachmentPath = widget.attachmentFile.value!.path.toLowerCase();
                        if (!['.pdf', '.doc', '.docx'].any((ext) => attachmentPath.endsWith(ext))) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Lampiran harus berupa file (pdf, doc, docx)!')),
                          );
                          return;
                        }
                      }
  
                      context.read<CompanyBloc>().add(
                        CompanyButtonPressed(
                          name: widget.nameController.text,
                          email: widget.emailController.text,
                          address: widget.addressController.text,
                          phone: widget.phoneController.text,
                          businessType: widget.businessTypeController.text,
                          description: widget.descriptionController.text,
                          notes: widget.notesController.text,
                          logo: widget.logoFile.value?.path ?? '',
                          attachment: widget.attachmentFile.value?.path ?? '',
                        ),
                      );
                    }, title: 'Kirim');
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
  }