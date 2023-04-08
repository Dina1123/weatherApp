import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.flag, required this.location, required this.url});

  Future<void> getData() async {
    try {
      final response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print (data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //  print (datetime);
      print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'something went wrong';
    }
  }
}