import 'package:flutter/material.dart';

class VaccineInfoGuide extends StatelessWidget {
  const VaccineInfoGuide({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          
        ),
      ),
      appBar: AppBar(
        title: const Text('Vaccine Info Guide')
      ),
    );
  }
}