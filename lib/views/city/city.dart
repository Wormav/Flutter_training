import 'package:flutter/material.dart';
import '../../data/data.dart' as data;
import '../../models/activity.model.dart';
import '../../models/trip.model.dart';
import 'widgets/activity_card.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({super.key});
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip mytrip = Trip(activities: [], city: 'Paris', date: DateTime.now());

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Choisissez une date'),
                    ),
                    ElevatedButton(
                      onPressed: setDate,
                      child: const Text('Sélectionnez une date'),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: widget.activities
                  .map((activity) => ActivityCard(activity: activity))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
