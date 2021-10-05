import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  final List<String> cardList = [
    'Babies start dreaming \neven before they\'re born',
    'Your eyes never grow \nand your nose and ears \nnever stop growing',
    'When you blush your stomach \nlining also reddens',
    'Your lungs inhale over \n2 million litres of air everyday'
  ];

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
            height: 100.0,
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
        items: cardList.map((content) {
          return Builder(builder: (BuildContext context) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: buildCard(content));
          });
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(cardList, (index, url) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
            ),
          );
        }),
      ),
    ]);
  }

  Widget buildCard(String content) {
    Widget card = Card(
        color: Colors.teal,
        child: Center(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child:
                Text("Did you know ?", style: TextStyle(color: Colors.white70)),
          ),
          Text(content,
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center)
        ])));
    return card;
  }
}
