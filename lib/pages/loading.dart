import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

  void setTime() async{
    WorldTime instace = WorldTime(flag: 'sudan.png', location: 'Khartoum', url: 'Africa/Khartoum');
    await instace.getData();
    Future.delayed(Duration(microseconds:500),()=>
    Navigator.pushReplacementNamed(context , '/home', arguments:{
      'location':instace.location , 'time': instace.time, 'flag':instace.flag , 'isDaytime':instace.isDaytime

    }));


    
  }



  @override
  void initState() {

    super.initState();
    setTime();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
      ),
      ),
    );
  }
}
