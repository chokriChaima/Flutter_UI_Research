import 'package:flutter/material.dart';
import 'package:tester_app/views/custom_widgets/side_bar.dart';

class OtherNavigationBar extends StatefulWidget {
  const OtherNavigationBar({Key? key}) : super(key: key);

  @override
  State<OtherNavigationBar> createState() => _OtherNavigationBarState();
}

class _OtherNavigationBarState extends State<OtherNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> widgets = [
    const Text(
      "Flutter UI",
    ),
    const Text("Dynamic UI"),
    const Text("Other Nav Bar")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Other Navigation Bar'),
        centerTitle: true,
      ),
      body: Center(child: widgets[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Flutter UI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Dynamic UI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Other Nav Bar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        onTap: _onItemTapped,
      ),
    );
  }
}
