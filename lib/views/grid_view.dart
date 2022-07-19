import 'package:flutter/material.dart';

class GridViewExapmle extends StatelessWidget {
  const GridViewExapmle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid view"),
            actions: const [
            Icon(Icons.adb),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert)],
          
        ),
        body: Container(  
            padding: const EdgeInsets.all(12.0),  
            child: GridView.builder(  
              itemCount: 4,  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  crossAxisSpacing: 15.0,  
                  mainAxisSpacing: 15.0  
              ),  
              itemBuilder: (BuildContext context, int index){  
                return Container(
                 color: Colors.grey[200],
                 child:Center(child : Text("Element $index")),
                );
              },  
            )),  
      );
        
    
  }
}