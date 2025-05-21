import 'package:bungasari_app/data/dataresource/auth_remote_dataresource.dart';
import 'package:bungasari_app/presentation/auth/blocs/login/login_bloc.dart';
import 'package:bungasari_app/presentation/home/blocs/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, MultiBlocProvider;
import 'presentation/auth/login_page.dart';

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
        home: LoginPage(),
      ),
    );
  }
}

//bottomNavigationBar: CustomTabBar(),
//CustomTabBar(),
