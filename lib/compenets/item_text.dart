import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {

  final String name;
  ItemText({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),
    );
  }


}
