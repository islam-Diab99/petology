import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/Network/dio_helper.dart';
import 'package:petology/cubit/app_cubit.dart';
import 'package:petology/layouts/app_layout.dart';
import 'package:petology/screens/login/login_view.dart';
import 'package:petology/screens/login/viewmodel/login_cubit.dart';
import 'package:petology/screens/register/register_view.dart';
import 'package:petology/screens/register/viewmodel/register_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context) =>AppCubit(),
        ),
        BlocProvider(create: (BuildContext context) =>  RegisterCubit(),
        ),
        BlocProvider(create: (BuildContext context) =>  LoginCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Petology',
        theme: ThemeData(
          primarySwatch: Colors.blue,

        ),
        home:  LoginView(),
      ),
    );
  }
}
