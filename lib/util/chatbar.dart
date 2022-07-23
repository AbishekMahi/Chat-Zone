// ignore_for_file: prefer_const_constructors, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  final String friName;
  final String friMsg;
  final String chatTime;
  final String friImage;

  const Chat({
    Key? key,
    required this.friName,
    required this.friMsg,
    required this.chatTime,
    required this.friImage,
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState(friName, friMsg, chatTime, friImage);
}

class _ChatState extends State<Chat> {
  final String friName;
  final String friMsg;
  final String chatTime;
  final String friImage;

  _ChatState(this.friName, this.friMsg, this.chatTime, this.friImage);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Padding(
        padding: EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0x54FFFFFF),
                      backgroundImage: AssetImage(
                        friImage,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            friName,
                            style: GoogleFonts.comfortaa(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            friMsg,
                            style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                color: Color.fromARGB(255, 218, 218, 218),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  chatTime,
                  style: GoogleFonts.comfortaa(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
