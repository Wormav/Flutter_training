import 'package:flutter/material.dart';
import '../../data/data.dart' as data;
import '../../models/activity.model.dart';
import 'widgets/activity_card.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({super.key});
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Paris'),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.extent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 2,
          crossAxisSpacing: 5,
          children: widget.activities
              .map((activity) => ActivityCard(activity: activity))
              .toList(),
        ),
      ),
    );
  }
}
