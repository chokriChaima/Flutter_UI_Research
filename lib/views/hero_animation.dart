import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tester_app/views/custom_widgets/side_bar.dart';
class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key? key, required this.photo, required this.onTap, required this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  //  timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Hero Animation part 1'),
      ),
      body: 
      Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'assets/images/ui2.png',
                    width: 100.0,
      
        onTap: () =>
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Hero Animation part 2'),
                ),
            body : PhotoHero(
        photo: 'assets/images/ui2.png',
        width: MediaQuery.of(context).size.width,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
                
                }
          ))
        
        )
          )
          );
        }
      
  }
