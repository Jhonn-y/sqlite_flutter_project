// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/models/UserModel.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(context.read<UserModel>().imgAvatar),
            radius: 60,
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.read<UserModel>().name,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(context.read<UserModel>().bithDate),
          ],
        ),
      ],
    );
  }
}
