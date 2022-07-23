import 'dart:developer';
import 'package:chat_app_1/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';
import '../screens/main.dart';
import '../util/loading.dart';
import '../util/textfield.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  void signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cpassword = cpasswordController.text.trim();

    if (email == '' || password == '' || cpassword == '') {
      setState(() {
        loading = false;
      });
      log('Please fill the details');
    } else if (password != cpassword) {
      setState(() {
        loading = false;
      });
      log('Password do not match!');
    } else {
      setState(() {
        loading = true;
      });
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const MainPage(),
            ),
          );
        }
      } on FirebaseAuthException catch (ex) {
        log((ex.code.toString()));
      }
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: loading
          ? const Loading()
          : Scaffold(
              backgroundColor: const Color(0xFF262525),
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Lottie.asset('assets/lottie/chat_bubbles.json',
                          width: 150),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Register Here!',
                        style: GoogleFonts.pacifico(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF2CC5B5)),
                        // color: Color(0xFF2CC5B5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Your friends are already here, join with them.',
                        style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: 'Username or Email',
                        hintText: 'Enter your email',
                        obscureText: false,
                        controller: emailController,
                        prefixIcon: Icons.account_circle_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid input!';
                          }
                          return null;
                        },
                      ),
                      PasswordField(
                        controller: passwordController,
                        labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: EvaIcons.lockOutline,
                      ),
                      PasswordField(
                        controller: cpasswordController,
                        labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: EvaIcons.lockOutline,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF2CC5B5)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ),
                          onPressed: signUp,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Register',
                              style: GoogleFonts.comfortaa(
                                  fontSize: 18,
                                  color: appTheme,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                        width: 150,
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInButton.mini(
                            padding: (8),
                            buttonType: ButtonType.google,
                            onPressed: () {},
                          ),
                          SignInButton.mini(
                            padding: (8),
                            buttonType: ButtonType.facebook,
                            onPressed: () {},
                          ),
                          SignInButton.mini(
                            padding: (8),
                            buttonType: ButtonType.twitter,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already an user?',
                            style: GoogleFonts.comfortaa(
                                fontSize: 18, color: Colors.white),
                          ),
                          TextButton(
                            child: Text(
                              'Login',
                              style: GoogleFonts.comfortaa(
                                  fontSize: 18,
                                  color: const Color(0xFF2CC5B5),
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
