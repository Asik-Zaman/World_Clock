import 'dart:convert';

import 'package:clock_world/Model/time_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<TimeModel> timeModel;
  late bool isDayTime = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      timeModel = getData();
    });
  }

// if response return { map }
  Future<TimeModel> getData() async {
    final response = await http
        .get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Dhaka'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = await jsonDecode(response.body);
      return TimeModel.fromJson(map);
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: FutureBuilder<TimeModel>(
          future: timeModel,
          builder: (context, AsyncSnapshot<TimeModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              String offset =
                  snapshot.data!.utcOffset.toString().substring(1, 3);
              DateTime now = DateTime.parse(snapshot.data!.datetime.toString());
              isDayTime = now.hour > 6 && now.hour < 20 ? false : true;
              return Stack(
                children: [
                  isDayTime == false
                      ? Container(
                          height: MediaQuery.of(context).size.height * 2,
                          width: MediaQuery.of(context).size.width * 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/day.png'),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 2,
                          width: MediaQuery.of(context).size.width * 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/night.png'),
                                  fit: BoxFit.cover)),
                        ),
                  Column(
                    children: [
                      Text(now
                          .add(Duration(hours: int.parse(offset)))
                          .toString()),
                      Text(snapshot.data!.timezone.toString()),
                      Text(snapshot.data!.utcOffset.toString()),
                    ],
                  ),
                ],
              );
            } else {
              return Text('Failed');
            }
          },
        ),
      ),
    );
  }
}
