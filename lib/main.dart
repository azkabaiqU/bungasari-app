import 'package:bungasari_app/data/dataresource/auth_local_dataresource.dart';
import 'package:bungasari_app/data/dataresource/auth_remote_dataresource.dart';
import 'package:bungasari_app/data/dataresource/company_remote_dataresource.dart';
import 'package:bungasari_app/presentation/auth/blocs/login/login_bloc.dart';
import 'package:bungasari_app/presentation/auth/blocs/register/register_bloc.dart';
import 'package:bungasari_app/presentation/auth/pages/login_page.dart';
import 'package:bungasari_app/presentation/connector.dart';
import 'package:bungasari_app/presentation/form/blocs/company_bloc.dart';
import 'package:bungasari_app/presentation/profile/blocs/logout/logout_bloc.dart';
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
        BlocProvider(
          create: (context) => RegisterBloc(
            AuthRemoteDataresource(),
            AuthLocalDataresource(),
          ),
        ),
        BlocProvider(
            create: (context) => CompanyBloc(CompanyRemoteDataresource()),
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
        home: FutureBuilder(
          future: AuthLocalDataresource().isAuthData(),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data == true){
              return ConnectorPage();
            }
            return LoginPage();
          }
        ),
      ),
    );
  }
}

//bottomNavigationBar: CustomTabBar(),
//CustomTabBar(),