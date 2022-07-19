import 'package:flutter/material.dart';
import 'package:tester_app/views/custom_widgets/expantion_tile.dart';
class ListViewSeperatedExample extends StatelessWidget {
  const ListViewSeperatedExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Seperated"),
       actions: const [
            Icon(Icons.adb),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert)],
      ),
      body: ListView.separated(
        separatorBuilder: ((context, index) => const Divider(thickness: 2,)),
          itemCount: 3,
          itemBuilder: (context,index)=>TestItem(desc: "testing number $index", title: "builder")
          )
      );
    
  }
}