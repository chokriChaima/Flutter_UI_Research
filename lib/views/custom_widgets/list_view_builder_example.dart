import 'package:flutter/material.dart';
import 'package:tester_app/views/custom_widgets/expantion_tile.dart';

class ListViewBuilderExample extends StatefulWidget {
   

   const ListViewBuilderExample({Key? key}) : super(key: key);
  @override
  State<ListViewBuilderExample> createState() => _ListViewBuilderExampleState();
}

class _ListViewBuilderExampleState extends State<ListViewBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(Icons.adb),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert)
          ],
          title: const Text("ListView Builder"),
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) =>
                TestItem(desc: "testing number $index", title: "builder")));
  }
}
