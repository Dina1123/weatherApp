import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/services/worldtime.dart';

class Loc extends StatefulWidget {
  const Loc({Key? key}) : super(key: key);

  @override
  _LocState createState() => _LocState();
}

class _LocState extends State<Loc> {

  List<WorldTime> locations = [
    WorldTime(flag: 'berlin.png' , location: 'Berlin' , url: 'Europe/Berlin'),
    WorldTime(flag: 'sudan.png' , location: 'Khartoum' , url: 'Africa/Khartoum'),
    WorldTime(flag: 'cccc.png' , location: 'Cairo' , url: 'Africa/Cairo'),
    //WorldTime(flag: 'china.png' , location: 'China' , url: 'Asia/Beijing'),
    WorldTime(flag: 'chhh.png' , location: 'Chicago' , url: 'America/Chicago'),
    WorldTime(flag: 'nnn.png' , location: 'New York' , url: 'America/New_york'),
    WorldTime(flag: 'london.png' , location: 'London' , url: 'Europe/London'),
    WorldTime(flag: 'sss.png' , location: 'Seoul' , url: 'Asia/Seoul'),
    WorldTime(flag: 'ne.png' , location: 'Nairobi' , url: 'Africa/Nairobi'),




  ];
 void updatetime (index) async{

    WorldTime instace = locations[index];
    await  instace.getData();
    Navigator.pop(context , {
      'location':instace.location ,
      'time': instace.time,
      'flag':instace.flag ,
      'isDaytime':instace.isDaytime,


    });


 }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder : (context , index ) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 4 ),
               child: Card(

                 child : ListTile (
                   onTap:(){
                     updatetime(index);
                   },
                   title: Text( locations[index].location
                   ),
                   leading: CircleAvatar(
                     backgroundImage: AssetImage('assets/${locations[index].flag}'),
                   ),

                 )



               ),
             );


          }),
    );
  }
}
