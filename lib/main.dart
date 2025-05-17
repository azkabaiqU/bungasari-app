import 'package:flutter/material.dart';
import 'presentation/auth/login_page.dart';

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
        // scaffoldBackgroundColor: Colors.amber,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

//bottomNavigationBar: CustomTabBar(),
//CustomTabBar(),
