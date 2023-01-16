import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String urll;
  late bool isDayTime;

  WorldTime({required this.flag, required this.location, required this.urll});

  Future<void> getData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$urll'));
      Map result = jsonDecode(response.body);

      String datetime = result['datetime'];
      String offset = result['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? false : true;
    } catch (e) {
      time = "Time Not Found";
      isDayTime = false;
    }
  }
}
