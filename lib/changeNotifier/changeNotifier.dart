// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_project/controllers/ProviderController.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await Future.delayed(Duration(seconds: 5));

      context.read<ProviderController>().modifyData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier Page'),
      ),
      body: Column(
        children: [
          Selector<ProviderController, String>(
            selector: (_,controller) => controller.imgAvatar,
            builder: (_, imgAvatar, __) {
              return Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imgAvatar),
                  radius: 60,
                ),
              );
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                selector: (_,controller) => controller.name,
                builder: (_, name, __) {
                  return Text(
                    name,
                    style: TextStyle(fontSize: 20.0),
                  );
                },
              ),
              SizedBox(
                width: 16.0,
              ),
              Selector<ProviderController, String>(
                selector: (_,controller) => controller.bithDate,
                builder: (_, bithDate, __) {
                  return Text(
                    bithDate,
                    style: TextStyle(fontSize: 20.0),
                  );
                },
              ),
              ElevatedButton(onPressed: (){
                context.read<ProviderController>().modifyName();
              }, child: Text("Alterar nome"))
            ],
          ),
        ],
      ),
    );
  }
}
