import 'package:flutter/material.dart';

import 'city_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cities = [
    {
      'name': 'Paris',
      'image': 'assets/images/paris.jpg',
    },
    {
      'name': 'Lyon',
      'image': 'assets/images/lyon.jpg',
    },
    {
      'name': 'Nice',
      'image': 'assets/images/nice.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Dyma Trip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cities
              .map((city) => CityCard(name: city['name'], image: city['image']))
              .toList(),
        ),
      ),
    );
  }
}
