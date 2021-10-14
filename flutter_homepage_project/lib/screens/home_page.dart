import 'package:flutter/material.dart';
import '../shared/secure_storage.dart';
import 'notifications.dart';
import 'book_now.dart';
import '../widgets/carousel.dart';
import 'vaccine_info_guide.dart';


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
           Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Fun Facts",
                  style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Carousel()),
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
              child: Stack(
                
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset('assets/cover.png',
                        fit: BoxFit.cover),
                  ),
                    Positioned(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Vaccine \nInformation \nGuide',
                                  textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                              IconButton(
                                key: HomePage.navigateToVaccineInfoGuid,
                                icon: const Icon(Icons.article, size: 30.0,color: Colors.white,),
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
                  )
                ],
              ),
            ),
          ),
         
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
