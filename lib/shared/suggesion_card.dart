import 'package:flutter/material.dart';
import 'package:learning_riverpod/models/suggestion.dart';

class SuggestionCard extends StatelessWidget {
  final Suggestion suggestion;
  const SuggestionCard({required this.suggestion, super.key});

  TextStyle textStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      height: size.height * .6,
      decoration: BoxDecoration(
        color: Colors.grey[500]!,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        border: Border.all(width: 0.5),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[700]!,
            Colors.grey[100]!,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Suggestion",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.person,
            size: 70,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Activity: ${suggestion.activity}",
                style: textStyle(),
              ),
              Text(
                "Type: ${suggestion.type}",
                style: textStyle(),
              ),
              Text(
                "Participants: ${suggestion.participants}",
                style: textStyle(),
              ),
              Text(
                "Price: \$${suggestion.price}",
                style: textStyle(),
              ),
              Text(
                "Link: ${suggestion.link}",
                style: textStyle(),
              ),
              Text(
                "Key: ${suggestion.key}",
                style: textStyle(),
              ),
              Text(
                "Accessibility: ${suggestion.accessibility}",
                style: textStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
