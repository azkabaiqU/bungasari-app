import 'package:bungasari_app/data/dataresource/auth_remote_dataresource.dart';
import 'package:bungasari_app/presentation/auth/blocs/login/login_bloc.dart';
import 'package:bungasari_app/presentation/auth/pages/login_page.dart';
import 'package:bungasari_app/presentation/form/pages/form_page.dart';
import 'package:bungasari_app/presentation/home/blocs/logout/logout_bloc.dart';
import 'package:bungasari_app/presentation/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, MultiBlocProvider;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataresource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(authRemoteDataresource: AuthRemoteDataresource()),
        ),
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // scaffoldBackgroundColor: Colors.amber,
          useMaterial3: true,
        ),
        home: ProfilePage(),
      ),
    );
  }
}

//bottomNavigationBar: CustomTabBar(),
//CustomTabBar(),