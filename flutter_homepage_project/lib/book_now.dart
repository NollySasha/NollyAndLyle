import 'package:flutter/material.dart';

class BookNow extends StatelessWidget {
  const BookNow({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo()
        ),
    appBar: AppBar(
      title: const Text('BookNow'),
    ),
    );
  }

}