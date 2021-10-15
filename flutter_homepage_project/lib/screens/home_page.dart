import 'package:flutter/material.dart';
import '../shared/secure_storage.dart';
import 'notifications.dart';
import 'book_now.dart';
import '../widgets/carousel.dart';
import 'vaccine_info_guide.dart';
import 'package:hexcolor/hexcolor.dart';

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
    setLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          shadowColor: Colors.transparent,
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
                    icon: Icon(Icons.circle_notifications,
                        size: 50, color: HexColor('27B88D'))),
              ),
            )
          ],
          title: const Text(
            'Welcome',
            style: TextStyle(color: Colors.black, fontFamily:'Lato'),
          ),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8.0, bottom: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Fun Facts",
                  style: TextStyle(fontSize: 18, fontFamily: 'Lato'), textAlign: TextAlign.left),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Carousel()),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned.fill(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                            Image.asset('assets/cover.png', fit: BoxFit.cover)),
                  ),
                  Positioned(
                    child: Container(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Vaccine Information Guide \n\n 100 + information on \n immunizations and vaccines',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                          ),
                          IconButton(
                            key: HomePage.navigateToVaccineInfoGuid,
                            icon: const Icon(
                              Icons.article,
                              size: 50.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VaccineInfoGuide()),
                              );
                            },
                          )
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                key: HomePage.navigateToBookNow,
                onPressed: isLoggedIn
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookNow()),
                        );
                      }
                    : null,
                child: Text("Book Now", style: TextStyle(color: Colors.white, fontFamily: 'Lato')),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(370, 50),
                    primary: HexColor('27B88D'),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)))),
          ),
        ]));
  }

  void setLoginStatus() async {
    bool result = await _storage!.isLoggedIn();
    setState(() {
      isLoggedIn = result;
    });
  }
}
