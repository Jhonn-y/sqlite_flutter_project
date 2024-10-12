// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/database/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    _connectDatabase_();
  }

  Future<void> _connectDatabase_() async {
    final db = await  DatabaseSqlite().openConnection();

  }
  
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushNamed('/provider');
                    
                  }, child: Text('Provider')),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushNamed('/changeNotifier');
                    
                  }, child: Text('Change Notifier')),
          
                ],
              ),
            ),
          );
        }
  }
  