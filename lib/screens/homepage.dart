import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/chatbar.dart';
import '../util/menu_list.dart';
import '../util/story_circle.dart';
import 'storypage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Color(0xFF56BBAA),
            Color(0xFF0186AD),
          ],
        ),
      ),
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Chat Zone',
            style: GoogleFonts.comfortaa(
                fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              splashRadius: 24,
              icon: const Icon(
                Icons.search_rounded,
              ),
              iconSize: 32,
            ),
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return IconButton(
                  splashRadius: 24,
                  icon: const Icon(
                    EvaIcons.menu2,
                  ),
                  iconSize: 32,
                  onPressed: () {
                    _scaffoldkey.currentState!.openEndDrawer();
                  },
                );
              },
            ),
          ],
        ),
        endDrawer: const MenuList(),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 15,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0x54FFFFFF)),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Text(
                                  'Add Story',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.comfortaa(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 2,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            StoryCircle(
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StoryPage(),
                                  ),
                                );
                                _openStory;
                              },
                              storyImage: 'assets/images/man.png',
                              storyName: 'Sri Sivas',
                            ),
                            const StoryCircle(
                              storyImage: 'assets/images/gamer.png',
                              storyName: 'Aakash Philips',
                            ),
                            const StoryCircle(
                              storyImage: 'assets/images/woman.png',
                              storyName: 'Kanimitha',
                            ),
                            const StoryCircle(
                              storyImage: 'assets/images/boy.png',
                              storyName: 'Jayasuriya',
                            ),
                            const StoryCircle(
                              storyImage: 'assets/images/girl.png',
                              storyName: 'Abi junior',
                            ),
                            const StoryCircle(
                              storyImage: 'assets/images/user.png',
                              storyName: 'Akash RP',
                            ),
                            const StoryCircle(
                              storyImage: 'assets/images/boy.png',
                              storyName: 'Kabilesh',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      color: const Color(0xFF262525),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 25, bottom: 10, left: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Chat',
                                  style: GoogleFonts.comfortaa(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          const Chat(
                            friImage: 'assets/images/gamer.png',
                            friName: 'Aakash Philips',
                            friMsg: 'unakku nalaiku surprise irukku da',
                            chatTime: '2m ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/woman.png',
                            friName: 'Kanimitha',
                            friMsg: 'Hey hi Kani, bring the laptop tomorrow',
                            chatTime: '2m ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/girl.png',
                            friName: 'Abi junior',
                            friMsg: 'Drawing vera level Abi 🔥🔥🔥🔥🔥',
                            chatTime: '2h ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/man.png',
                            friName: 'Sri Sivas',
                            friMsg:
                                'dai sri flutter ethu varaikum da pathuirukka',
                            chatTime: '5h ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/user.png',
                            friName: 'Akash RP',
                            friMsg: 'Ennada meendum depressiona?',
                            chatTime: '16h ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/girl.png',
                            friName: 'Liju Tony',
                            friMsg: 'summa uruttadha da mayiru😠',
                            chatTime: '23h ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/boy.png',
                            friName: 'Jayasuriya',
                            friMsg: 'Dai nalaikku clg variya enna? ',
                            chatTime: '2d ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/girl.png',
                            friName: 'Karthiga',
                            friMsg: 'inime doggy filter podadha paaka mudiyala',
                            chatTime: '3d ago',
                          ),
                          const Chat(
                            friImage: 'assets/images/user.png',
                            friName: 'Balaji',
                            friMsg: 'Dai uyiroda dhan irukkiya? illa sethutiya',
                            chatTime: 'Dead',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
