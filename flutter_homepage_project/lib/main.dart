import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/bloc/auth_bloc.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/bloc/auth_state.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc(NotLoggedIn()))],
        child: MaterialApp(
            theme: ThemeData(primarySwatch: Colors.teal),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {'/': (context) => HomePage()}));
  }
}
