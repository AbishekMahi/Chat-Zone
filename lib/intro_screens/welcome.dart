import 'package:chat_app_1/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262525),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: <Widget>[
                // page1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Lottie.asset('assets/lottie/welcome.json'),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Welcome to Chat Zone',
                        style: GoogleFonts.pacifico(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF2CC5B5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Chat with your friends, family and colleagues.',
                        style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            letterSpacing: 1.1,
                            height: 1.5,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),

                // page 2
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Lottie.asset('assets/lottie/chatting.json'),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Conectivity',
                        style: GoogleFonts.pacifico(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2CC5B5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Connect with your friend any where, any time.',
                        style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            letterSpacing: 1.1,
                            height: 1.5,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),

                // page 3
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Lottie.asset('assets/lottie/group.json'),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Group Chats',
                        style: GoogleFonts.pacifico(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2CC5B5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Create groups and get in touch with your friends.',
                        style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            letterSpacing: 1.1,
                            height: 1.5,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.65),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                    spacing: 12.0,
                    dotWidth: 8.0,
                    dotHeight: 8.0,
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFF2CC5B5)),
              ),
            ),

            // Get started button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF2CC5B5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.comfortaa(
                            fontSize: 20,
                            color: appTheme,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                      //The user picked true.
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
