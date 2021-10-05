import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
   
        title: const Text('Welcome'),
      ),
      body: Column(children: <Widget>[
        Card(child: Image.asset('assets/home.jpg')),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('How Vaccines Work', style: TextStyle(fontSize: 20.0)),
        ),
         IntrinsicHeight(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
            Expanded(child: Card(child: Image.asset('assets/play.png')),flex: 7),
             Expanded(child: Container(
               decoration: BoxDecoration(color: Colors.teal.shade100,borderRadius: BorderRadius.circular(10.0)),
               child: Column(
                 children: [
                 const Text('Vaccine \nInformation \nGuide'),
                 IconButton(
                 icon: const Icon(Icons.article,size: 40.0),
                 tooltip: 'Vaccine Information Guide',
                 onPressed: (){},
               )],
               ) 
             ),flex: 4)
             ],
           ),
         )      
      ])
    );
  }
}
