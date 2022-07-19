import 'dart:math';

import 'package:flutter/material.dart';
import 'custom_widgets/emoji.dart';
import 'custom_widgets/side_bar.dart';

class ColorGame extends StatefulWidget {
  const ColorGame({Key? key}) : super(key: key);

  @override
  State<ColorGame> createState() => _ColorGameState();
} 

class _ColorGameState extends State<ColorGame> {
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
  };
  final Map<String, bool> score = {};
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
        appBar: AppBar(
            title: Text('Score ${score.length} / 6'),
            backgroundColor: Theme.of(context).colorScheme.primary),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              score.clear();
              seed++;
            });
          },
        ),
        body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: choices.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                  feedback: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                  childWhenDragging:const  Emoji(emoji: '🌱'),
                );
              }).toList()),
              
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
                  // .. : cascade notation
          )
        ],
      ),);
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.grey[100],
            child:  Text('Correct!',style: TextStyle(fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
         
        });
      },
      onLeave: (data) {},
    );
  }

}
