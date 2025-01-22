import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nomad_challenge_final/providers/movie_provier.dart';
import 'package:nomad_challenge_final/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MovieProvider(),),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
