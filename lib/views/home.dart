import 'package:flutter/material.dart';

import 'package:tester_app/views/custom_widgets/side_bar.dart';
import 'package:tester_app/views/semi_models/item.dart';

import 'custom_widgets/demo_card.dart';
 import 'package:tester_app/views/custom_widgets/animations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {
 
 final ScrollController _controller =  ScrollController();

    List<DemoCard> get _cards => items.map((e) => DemoCard(item : e)).toList();
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text("Flutter UI"),
        centerTitle: true,
      ),
      // body:const Animations()
      body :
      Stack(

                alignment: AlignmentDirectional.topStart,
                children: <Widget>[

                    AnimatedBackground(controller: _controller),
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ListView(
                              controller: _controller,
                              children: _cards
                          ),
                        )
                    )
                ]
            )
        ); 
         
        
      
    
  }
}


