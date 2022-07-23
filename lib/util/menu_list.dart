import 'package:chat_app_1/intro_screens/login.dart';
import 'package:chat_app_1/util/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appTheme,
      child: ListView(
        children: [
          InkWell(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ProfilePage(),
            //   ),
            // ),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [appThemeLeft, appThemeRight])),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/images/man.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Abishek Mahi',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    user.email!,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Account',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.bookmark_border_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Saved',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.devices_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Devices',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              EvaIcons.settings2Outline,
              color: Colors.white,
            ),
            title: Text(
              'Settings',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.white70,
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.help_outline_rounded,
              color: Colors.white,
            ),
            title: Text(
              'FAQs',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.bug_report_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Report Bugs',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              EvaIcons.logOutOutline,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              textAlign: TextAlign.start,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/splash.png',
                height: 50,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'App Version - v 1.0.0',
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
