import 'package:flutter/material.dart';
import 'package:tester_app/views/custom_widgets/bottom_navigation_bar.dart';
import 'package:tester_app/views/hero_animation.dart';
import 'package:tester_app/views/home.dart';
import 'package:tester_app/views/video_of_week.dart';

import '../list_view.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              child: Image(
            image: AssetImage("assets/images/ui1.png"),
            fit: BoxFit.cover,
          )),
          ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              title: const Text(
                "Flutter UI",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "EBGaramond",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const Home()))),
          ListTile(
              leading: Icon(
                Icons.dynamic_feed,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              title: const Text(
                "Dynamic User Interface",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "EBGaramond",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ListViewExample()))),
          ListTile(
              leading: Icon(
                Icons.navigation,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              title: const Text(
                "Other Navigation Bar",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "EBGaramond",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const OtherNavigationBar()))),
          ListTile(
              leading: Icon(
                Icons.animation,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              title: const Text(
                "Hero Animation",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "EBGaramond",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HeroAnimation()))),

         ListTile(
              leading: Icon(
                Icons.video_collection,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              title: const Text(
                "Video of the week",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "EBGaramond",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const VideoOfWeek()))),
        ],
      ),
    );
  }
}
