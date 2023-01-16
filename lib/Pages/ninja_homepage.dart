import 'package:clock_world/Model/world_time_model.dart';
import 'package:flutter/material.dart';

class NinjaHomePage extends StatefulWidget {
  NinjaHomePage({
    super.key,
  });

  @override
  State<NinjaHomePage> createState() => _NinjaHomePageState();
}

class _NinjaHomePageState extends State<NinjaHomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                          fontSize: 28, letterSpacing: 2, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  data['time'],
                  style: const TextStyle(fontSize: 66, color: Colors.white),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit_location, color: Colors.white),
                  onPressed: (() async {
                    dynamic res =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': res['time'],
                        'location': res['location'],
                        'isDayTime': res['isDayTime'],
                        'flag': res['flag']
                      };
                    });
                  }),
                  label: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'Choose Location',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
