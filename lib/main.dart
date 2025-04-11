import 'package:flutter/material.dart';
import 'package:tsw_custom_transition_route/pages/page1.dart';
import 'package:tsw_custom_transition_route/pages/page2.dart';
import 'package:tsw_custom_transition_route/pages/page3.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': ( _ ) => PageUno(),
        'page2': ( _ ) => PageDos(),
        'page3': ( _ ) => PageTres()
      },
    );
  }
}