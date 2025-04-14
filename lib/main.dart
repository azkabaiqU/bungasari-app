import 'package:flutter/material.dart';
import 'preference/preference.dart';

// import 'presentation/home/page/home_page.dart';
import 'presentation/form_page.dart';
// import 'presentation/profile_page.dart';
// import 'presentation/ujicoba.dart';
// import 'presentation/ujicoba2.dart';

// import 'widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColor.bgWhite,
        useMaterial3: true,
      ),
      home: FormPage(),
    );
  }
}
