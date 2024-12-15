import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/joke.dart';
import '../widgets/joke_card.dart';

class JokesScreen extends StatelessWidget {
  final String category;

  const JokesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Jokes')),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load jokes'));
          } else {
            final jokes = snapshot.data ?? [];
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeCard(joke: jokes[index]);
              },
            );
          }
        },
      ),
    );
  }
}
