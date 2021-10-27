import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/carousel.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  static const navigateToVaccineInfoGuid = Key('navigateToVaccineInfoGuid');
  static const navigateToBookNow = Key('navigateToBookNow');
  static const navigateToNotifications = Key('navigateToNotifications');

  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Visibility(
                        visible: state is LoggedIn ? true : false,
                        child: IconButton(
                            key: HomePage.navigateToNotifications,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FlutterLogo()),
                              );
                            },
                            icon: Icon(Icons.circle_notifications,
                                size: 50, color: HexColor('27B88D'))),
                      );
                    }))
          ],
          title: const Text(
            'Welcome',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 8.0, bottom: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Fun Facts",
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.left),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: const Carousel()),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset('/cover.png', fit: BoxFit.cover),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Vaccine Information Guide \n\n 100 + information on \n immunizations and vaccines',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
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
                                      builder: (context) => FlutterLogo()),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ElevatedButton(
                      key: HomePage.navigateToBookNow,
                      onPressed: state is LoggedIn
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FlutterLogo()),
                              );
                            }
                          : null,
                      child: const Text("Book Now",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(370, 50),
                          primary: HexColor('27B88D'),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))));
                },
              )),
        ]));
  }
}
