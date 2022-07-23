import 'package:chat_app_1/intro_screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ChatApp(),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      // initialRoute: 'welcome_screen',
      // routes: {
      //   'welcome_screen': (context) => const Welcome(),
      //   'login_screen': (context) => const Login(),
      //   'register_screen': (context) => const Signup(),
      //   'home_screen': (context) => const MainPage(),
      // },
    );
  }
}
