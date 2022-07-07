import 'package:flutter/material.dart';
import 'package:tester_app/views/custom_widgets/side_bar.dart';
import 'package:tester_app/views/custom_widgets/animations.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {
 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text("Flutter UI"),
        centerTitle: true,
      ),
      body:const Animations()
          // Center(
          //     child: Text(
          //   "Video of the week",
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // )),
          // InitializeVideoPlayer()
        
      );
    
  }
}


