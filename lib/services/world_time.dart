import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String time;
  String location;
  String flag;
  String url;
  bool isDay;

  WorldTime({this.time, this.location, this.flag, this.url});

  Future<void> getData() async{

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
      
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set time property 
      isDay = now.hour > 6 && now.hour < 18 ? true: false;
      time = DateFormat.jm().format(now);
    }catch(e){
      time = "Couldn't load";
      isDay = true;
      
    }
  }
}