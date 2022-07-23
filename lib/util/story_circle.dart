// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryCircle extends StatelessWidget {
  final String storyImage;
  final String storyName;
  final function;
  const StoryCircle({
    Key? key,
    required this.storyImage,
    required this.storyName,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        width: 78,
        child: Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Color(0x54FFFFFF),
              backgroundImage: AssetImage(
                storyImage,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              storyName,
              style: GoogleFonts.comfortaa(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 2,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}
