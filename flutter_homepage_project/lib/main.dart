import 'package:flutter/material.dart';
import 'carousel.dart';
import 'vaccine_info_guide.dart';
import 'book_now.dart';
import 'notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
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
   late bool isLoggedIn;
  
@override
  void initState() {
   isLoggedIn = true;
   super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Visibility(
                visible: isLoggedIn,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                     context,
                        MaterialPageRoute(builder: (context) => Notifications()),
                  );
                    },
                    icon: Icon(Icons.circle_notifications, size: 40)),
              ),
            )
          ],
          title: const Text('Welcome'),
        ),
        body: Column(children: <Widget>[
          Container(
              width: 320,
              height: 150,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image.asset('assets/home.jpg', fit: BoxFit.fitWidth))),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              'How Vaccines Work',
              style: TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: 320,
              height: 100,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Card(
                            child: Image.asset('assets/play.png',
                                fit: BoxFit.fitWidth)),
                        flex: 7),
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.teal.shade100,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  const Text('Vaccine \nInformation \nGuide',
                                      textAlign: TextAlign.center),
                                  IconButton(
                                    icon: const Icon(Icons.article, size: 30.0),
                                    onPressed: (){
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(builder: (context) => VaccineInfoGuide()),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )),
                        flex: 4)
                  ],
                ),
              ),
            ),
          ),
          Text("Fun Facts",
              style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
          Carousel(),
          Visibility(
            visible: isLoggedIn,
            child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                     context,
                        MaterialPageRoute(builder: (context) => BookNow()),
                  );
                },
                child: Text("Book Now"),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 40),
                    primary: Colors.teal,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)))),
          )
        ]));
  } 
 
}
