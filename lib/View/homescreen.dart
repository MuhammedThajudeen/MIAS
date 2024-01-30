import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mias/View/SubjectsListscreen.dart';
import 'package:mias/View/loginscreen.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';
import 'package:mias/utils/user_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: mainColor,
          title: Text(''),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text(
                            'Logout',
                            style: dialogboxTitlestyle(22),
                          ),
                          content: Text(
                            'Are you sure you want to logout?',
                            style: dialogboxTitlestyle(18),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const loginscreen()));
                                  saveLoginStatus(0);
                                },
                                child: const Text('Yes')),
                          ]);
                    });
              },
              icon: const Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: Container(
          color: mainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Wrap(
                          children: [
                            Text('Malabar ',
                                style: instituteNamestyle(Colors.white)),
                            Text('Institute of',
                                style: instituteNamestyle(Colors.red)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Wrap(
                          children: [
                            Text('Advanced ',
                                style: instituteNamestyle(Colors.red)),
                            Text('Studies',
                                style: instituteNamestyle(Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Image.asset(miasLogo, height: 80, width: 130),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubjectlistScreen()));
                    },
                    child: Container(
                      height: 80,
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color(0xff872341),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text('Plus One', style: buttonFontstyle)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
