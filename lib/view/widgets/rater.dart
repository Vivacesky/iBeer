import 'package:flutter/material.dart';

class Rater extends StatefulWidget {
  const Rater({Key? key}) : super(key: key);

  @override
  State<Rater> createState() => _RaterState();
}

class _RaterState extends State<Rater> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() => rating = 1);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Icon(rating >= 1 ? Icons.star : Icons.star_border, size: 50),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => rating = 2);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Icon(rating >= 2 ? Icons.star : Icons.star_border, size: 50),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => rating = 3);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Icon(rating >= 3 ? Icons.star : Icons.star_border, size: 50),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => rating = 4);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Icon(rating >= 4 ? Icons.star : Icons.star_border, size: 50),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => rating = 5);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Icon(rating >= 5 ? Icons.star : Icons.star_border, size: 50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop(rating);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
