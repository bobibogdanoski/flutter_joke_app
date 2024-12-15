import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../widgets/joke_card.dart';

class RandomJokeScreen extends StatelessWidget {
  final Joke joke;

  const RandomJokeScreen({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: Center(
        child: JokeCard(joke: joke),
      ),
    );
  }
}
