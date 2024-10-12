// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/controllers/ProviderController.dart';
import 'package:sqlite_flutter_project/changeNotifier/changeNotifier.dart';
import 'package:sqlite_flutter_project/models/UserModel.dart';
import 'package:sqlite_flutter_project/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_project/provider/Provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => UserModel(
              name: 'Jhonatan',
              imgAvatar:
                  'https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-536613027.jpg',
              bithDate: '08/10/2004'),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Builder(builder: (context) {
          return Home();
        }),
        routes: {
          '/provider': (_) => ProviderPage(),
          '/changeNotifier': (_) => ChangeNotifierPage(),
        },
      ),
    );
  }
}
