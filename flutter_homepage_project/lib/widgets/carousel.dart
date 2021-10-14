import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  Map<String, String> ourMap = {
    'immunizationimage1.jpg':
        'Your eyes never grow and your \n nose and ears never stop growing',
    'immunizationimage2.jpg':
        'Your lungs inhale over 2 million \n liters of air everyday',
    'immunizationimage3.jpg':
        'Babies start dreaming \n even before they are born',
    'immunizationimage4.jpg':
        'When you blush your stomach \n lining also reddens'
  };

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height / 2.3,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          items: ourMap.entries.map((e) => buildCard(e)).toList()),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(ourMap.entries.toList(), (index, url) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? HexColor('27B88D') : Colors.grey,
            ),
          );
        }),
      ),
    ]);
  }

  Widget buildCard(MapEntry<String, String> entry) {
    Widget card = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Card(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/' + entry.key,
                fit: BoxFit.cover,
              ),
            )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(entry.value,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center))
      ],
    );
    return card;
  }
}
