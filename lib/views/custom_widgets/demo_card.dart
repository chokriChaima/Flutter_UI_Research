// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../semi_models/item.dart';

class DemoCard extends StatelessWidget {
  const DemoCard(
    {Key? key,
    required this.item,}
  ) : super(key: key);
  final Item item;

  static const Shadow _shadow =
      Shadow(offset: Offset(2.0, 2.0), color: Colors.black26);
  final TextStyle _style =
      const TextStyle(color: Colors.white70, shadows: [_shadow]);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.black26),
            borderRadius: BorderRadius.circular(32)),
        color: item.color.withOpacity(.7),
        child: Container(
            constraints: const BoxConstraints.expand(height: 200),
            child: RawMaterialButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(item.name, style: _style.copyWith(fontSize: 64)),
                        Icon(item.icon, color: Colors.white70, size: 72),
                      ])
                ],
              ),
            )));
  }
}
