import 'dart:async';
import 'package:clock_world/Model/world_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setTime() async {
    WorldTime instance =
        WorldTime(flag: 'germany.png', location: 'Dhaka', urll: 'Asia/Dhaka');
    await instance.getData();
    Timer(
        Duration(seconds: 2),
        (() => Navigator.pushReplacementNamed(context, '/home', arguments: {
              'location': instance.location,
              'flag': instance.flag,
              'time': instance.time,
              'isDayTime': instance.isDayTime
            })));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => setTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )),
      ),
    );
  }
}
