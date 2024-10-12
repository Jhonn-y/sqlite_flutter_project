// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/widgets/ProviderWidget.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider Page'),
        ),
        body: Padding(padding: EdgeInsets.all(8.0),
        child: ProviderWidget(),
        ),
        );
  }
}