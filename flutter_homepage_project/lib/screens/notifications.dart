import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
      appBar: AppBar(
      title: const Text('Notifications'),
      ),
    );
  }
}