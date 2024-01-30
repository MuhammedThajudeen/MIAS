import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:mias/View/homescreen.dart';
import 'package:mias/View/loginscreen.dart';
import 'package:mias/firebase_options.dart';
import 'package:mias/utils/constants.dart';
import 'package:mias/utils/user_info.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            future: readLoginStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                constLoginStatus = snapshot.data ?? 0;
                if (constLoginStatus == 1) {
                  return const SafeArea(child: HomeScreen());
                } else {
                  return const SafeArea(child: loginscreen());
                }
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                );
              }
            })
    
        //  SafeArea(child: loginscreen()),
        );
  }
}
