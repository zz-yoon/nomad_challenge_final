import 'package:flutter/material.dart';
import 'package:nomad_challenge_final/network/models/movie_detail_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieDetail movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      //body: SafeArea(child:
      //),
    );
  }
}
