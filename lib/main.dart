import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tester_app/views/home.dart';
import 'package:tester_app/views/list_view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.light(
        primary:HexColor("#95bccc") ,
        onPrimary: Colors.white,
        secondary: HexColor("#FFCD4B"),
        onSecondary: Colors.white,
        ),
       ),
      // home: const ListViewExample(title: 'Dynamic user interface'),
      home : const Home()

  );
    
  }
}



