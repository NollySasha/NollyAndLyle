import 'package:flutter/material.dart';
import '../shared/secure_storage.dart';
import 'notifications.dart';
import 'book_now.dart';
import '../widgets/carousel.dart';
import 'vaccine_info_guide.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final SecureStorage? storage;
  static const navigateToVaccineInfoGuid = Key('navigateToVaccineInfoGuid');
  static const navigateToBookNow = Key('navigateToBookNow');
  static const navigateToNotifications = Key('navigateToNotifications');
  const HomePage({Key? key, @required this.storage}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  late SecureStorage? _storage;

  @override
  void initState() {
    _storage = widget.storage;
    isLoggedIn = _storage!.isLoggedIn();
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
                  key: HomePage.navigateToNotifications,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()),
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image.asset('assets/home.jpg', fit: BoxFit.fitWidth))),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 45.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'How Vaccines Work',
                style: TextStyle(fontSize: 15.0),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Card(
                            child: Image.asset('assets/play.png',
                                fit: BoxFit.cover)),
                        flex: 7),
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.teal.shade100,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Vaccine \nInformation \nGuide',
                                      textAlign: TextAlign.center),
                                  IconButton(
                                    key: HomePage.navigateToVaccineInfoGuid,
                                    icon: const Icon(Icons.article, size: 30.0),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VaccineInfoGuide()),
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
          Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Fun Facts",
                  style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
            ),
          ),
          Carousel(),
          ElevatedButton(
            key: HomePage.navigateToBookNow,
              onPressed: isLoggedIn
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookNow()),
                      );
                    }
                  : null,
              child: Text("Book Now"),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 40),
                  primary: Colors.teal,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))))
        ]));
  }
}
