import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    print(data);
    String bgImage = data['isDaytime'] ? 'day2.png' : 'night2.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 66, 5, 0),
                child: TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/loc');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 4,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 74,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
