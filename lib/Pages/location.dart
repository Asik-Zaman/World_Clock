import 'dart:async';

import 'package:clock_world/Model/world_time_model.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(urll: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urll: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urll: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urll: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urll: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urll: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urll: 'Asia/Dhaka', location: 'Dhaka', flag: 'south_korea.png'),
    WorldTime(urll: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void update(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pop(context, {
              'location': instance.location,
              'flag': instance.flag,
              'time': instance.time,
              'isDayTime': instance.isDayTime
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    update(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
