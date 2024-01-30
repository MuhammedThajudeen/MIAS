// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mias/View/homescreen.dart';
import 'package:mias/utils/constants.dart';
import 'package:mias/utils/user_info.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: (){
          return Future.value(true);
        },
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: mainColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image.asset(
                            loginImage,
                            fit: BoxFit.contain,
                          )),
                      //textfieldname(310, 'Username'),
                      //  customtextfield(450, 'Password')
                    ],
                  ),
                  SizedBox(height: 40,),
                  customtextfield('Email', usernameController,
                      passwordtext: false, status: 1),
                  const SizedBox(
                    height: 40,
                  ),
                  customtextfield('Password', passwordController,
                      passwordtext: true, status: 2),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        resetPassword();
                      },
                      child: const Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 109, 207, 226)),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 80, right: 80),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 79, 144),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: TextButton(
                        onPressed: () {
                          loginUser();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customtextfield(String text, TextEditingController controller,
      {required bool passwordtext, required int status}) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        // color: Colors.yellow,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: rowfield(text, controller,
            passwordtext: passwordtext, status: status),
      ),
    );
  }

  rowfield(String? textname, TextEditingController controller,
      {required bool passwordtext, required int status}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextFormField(
          // cursorColor: Colors.black,
          autocorrect: false,
          autofocus: false,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.text,
          obscureText: status == 2 && showPassword == false,
          textInputAction:
              status == 1 ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 0),
            hintText: textname,
            hintStyle: const TextStyle(
              color: Color(0xffa2a2a2),
              fontSize: 16.0,
              // fontFamily: FONT_PRODUCT_SANS,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: GoogleFonts.oxygen(
            color: Colors.white,
            fontSize: 15,
            // fontFamily: fontName,
            fontWeight: FontWeight.w400,
          ),
        )),
        Visibility(
          visible: passwordtext,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 30,
              // color: Colors.green,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (showPassword == true) {
                      showPassword = false;
                    } else {
                      showPassword = true;
                    }
                    });
                  },
                  icon: Icon(
                    showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      // Navigate to the main screen upon successful login
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      usernameController.clear();
      passwordController.clear();
      saveLoginStatus(1);
    } catch (e) {
      // Handle login errors
      dialogBox('Login Failed', 'Invalid email or password');
      
    }
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: usernameController.text,
      );

      // Password reset email sent successfully
      dialogBox('Password Reset', 'A password reset email has been sent to your email address.');
    } catch (e) {
      // Handle errors (e.g., user not found, invalid email)
      usernameController.text.isEmpty ? dialogBox('Please enter a email', ''):dialogBox('Please enter a valid email', '');
      print('error..${e.toString()}');
    }
  }

  dialogBox(String title,String content){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title,style: dialogboxTitlestyle(23),),
            content: content == ''? null : Text(content,style: dialogboxTitlestyle(16),),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK',),
              ),
            ],
          );
        },
      );
  }
}
