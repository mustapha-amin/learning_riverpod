import 'dart:math';

import 'package:flutter/material.dart';

class ProviderTile extends StatelessWidget {
  final String title;
  final Widget destination;

  const ProviderTile({
    required this.title,
    required this.destination,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Container(
        height: 200,
        color: Color.fromARGB(
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
