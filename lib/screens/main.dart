import 'package:chat_app_1/screens/calls_screen.dart';
import 'package:chat_app_1/screens/groups.dart';
import 'package:chat_app_1/screens/homepage.dart';
import 'package:chat_app_1/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    const HomePage(),
    const Groups(),
    const Calls(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Zone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          backgroundColor: const Color(0xFF262525),
          color: const Color(0xFF2CC5B5),
          height: 60,
          animationDuration: const Duration(milliseconds: 300),
          items: const <Widget>[
            Icon(
              EvaIcons.messageCircle,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              EvaIcons.people,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              EvaIcons.phone,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
