import 'package:flutter/material.dart';
import 'package:newproject/pages/home.dart';
import 'package:newproject/pages/loc.dart';
import 'package:newproject/pages/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Load(),
        '/home': (context) => Home(),
        '/loc': (context) => Loc(),
      },
    ));
