import 'package:flutter/material.dart';

class TestItem extends StatelessWidget {
  final String desc;
  final String title;
  const TestItem({required this.desc, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
  title: Text(
    title,
    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
  ),
  leading: const Icon(Icons.list),
  // trailing: Text("Far right",style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)),
  children: <Widget>[
    ListTile(
      title: Text(
        desc,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    )
  ],
);
  }
}
