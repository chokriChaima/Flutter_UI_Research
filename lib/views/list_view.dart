import 'package:flutter/material.dart';
import 'package:tester_app/views/grid_view.dart';

import 'custom_widgets/list_view_builder_example.dart';
import 'custom_widgets/list_view_seperated_example.dart';
import 'custom_widgets/side_bar.dart';

class ListViewExample extends StatelessWidget {
 
  const ListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("first element in the app bar");
                },
                icon: const Icon(Icons.adb)),
            IconButton(
                onPressed: () {
                  print("second element in the app bar");
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  print("final element of the app bar");
                },
                icon: const Icon(Icons.more_vert))
          ],
          title: const Text("Dynamic UI"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 20, 18, 0),
          child: ListView(

            children: [
              ListView(
                
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ListViewBuilderExample())),
                  child: const Text("ListView builder")),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ListViewSeperatedExample())),
                  child: const Text("ListView seperated")),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const GridViewExapmle())),
                  child: const Text("See grid")),
              const SizedBox(
                height: 15,
              ),
          
            ],
          ),
        ));
  }
}
