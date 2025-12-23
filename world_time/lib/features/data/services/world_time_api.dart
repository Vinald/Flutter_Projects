import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTimeApi {
  String location;
  String time = '';
  String flag;
  String url;

  WorldTimeApi({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make a request
      Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'),
      );
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get time data';
    }
  }
}
