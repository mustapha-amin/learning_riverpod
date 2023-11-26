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

  Color randomColor() => Color.fromARGB(
        255,
        Random().nextInt(225) + 30,
        Random().nextInt(225) + 30,
        Random().nextInt(225) + 30,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          color: randomColor(),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              offset: Offset(-8, 6),
            ),
          ],
        ),
        margin: const EdgeInsets.all(8),
        height: 50,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
