import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mias/View/homescreen.dart';
import 'package:mias/View/subjects/botonyScreen.dart';
import 'package:mias/View/subjects/chemistryScreen.dart';
import 'package:mias/View/subjects/mathScreen.dart';
import 'package:mias/View/subjects/zoologyScreen.dart';
import 'package:mias/View/youtubeplayeer.dart';
import 'package:mias/firebase_options.dart';

import 'View/Subjectscreen.dart';
import 'View/subjects/physicsScreen.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/subjects': (context) => const SubjectScreen(),
        '/physics': (context) => const Physics(),
        '/chemistry': (context) => const Chemistry(),
        '/maths': (context) => const Maths(),
        '/zoology': (context) => const Zoology(),
        '/botony': (context) => const Botony(),
        '/youtubeplayer': (context) => const youtubeplayer(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
