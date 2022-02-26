import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tutorprovide/web_pge.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant.dart';
import 'custom_icon/my_flutter_app_icons.dart';

String msgUrl = "https://m.me/tutorprovide";
String youtubeUrl = "https://www.youtube.com/watch?v=JHROR1YMxwA";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  double opacity = 0.85;
  final List imgList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Constant.onBackPressed,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          //appBar: Constant.appBar("Tutor Provide", context),
          body: Stack(
            children: <Widget>[
              CarouselSlider(
                items: getItem(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  aspectRatio: 1,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.2),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 150,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Category(
                            "https://tutorprovide.com/tutorprovide/home",
                            backgroundColor: Colors.pink.withOpacity(opacity),
                            icon: MyIcons.home,
                            title: "HOME".toUpperCase(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Category(
                            "https://tutorprovide.com/login",
                            backgroundColor:
                                Colors.deepOrange.withOpacity(opacity),
                            icon: MyIcons.login,
                            title: "Sign In".toUpperCase(),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Category(
                            "https://tutorprovide.com/tutorprovide/rast",
                            backgroundColor: Colors.purple.withOpacity(opacity),
                            icon: MyIcons.user_plus,
                            title: "Tutor\nRegistrtion".toUpperCase(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Category(
                            "https://tutorprovide.com/tutorprovide/rft",
                            backgroundColor:
                                Colors.blueAccent.withOpacity(opacity),
                            icon: MyIcons.users,
                            title: "Guardian\nRegistrtion".toUpperCase(),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Category(
                            "https://tutorprovide.com/tutorprovide/tution-board",
                            backgroundColor: Colors.green.withOpacity(opacity),
                            icon: MyIcons.book_open,
                            title: "Available \nTutions".toUpperCase(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Category(
                            "https://tutorprovide.com/tutorprovide/OurTerm",
                            backgroundColor: Colors.lime.withOpacity(opacity),
                            icon: MyIcons.book_open,
                            title: "Service \nCharge".toUpperCase(),
                          ),
                        ],
                      ),
                      getSquareItem(
                          name: "Blood Bank",
                          url:
                              "https://tutorprovide.com/tutorprovide/bloodbank",
                          color: Colors.red.withOpacity(opacity)),
                      getSquareItem(
                          name: "Library",
                          url:
                              "https://drive.google.com/drive/folders/1mVfmyaDX5NnXdGDJSqtg3JbYcaRWLD63",
                          color: Colors.blue.withOpacity(opacity)),
                      getSquareItem(
                          name: "FAQ",
                          url: "https://tutorprovide.com/tutorprovide/faq",
                          color: Colors.pink.withOpacity(opacity)),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      "Tutor Provide",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black38,
                          ),
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 3.0,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  boxShadow: const [BoxShadow(blurRadius: 40.0)],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            color: Colors.green[100],
            padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                navBarChild(
                    name: "Facebook",
                    icon: FontAwesomeIcons.facebook,
                    url: "https://www.facebook.com/tutorprovide/",
                    color: Colors.blue),
                navBarChild(
                    name: "Messenger",
                    icon: FontAwesomeIcons.facebookMessenger,
                    url: msgUrl,
                    color: Colors.blue),
                navBarChild(
                    name: "Youtube",
                    icon: FontAwesomeIcons.youtube,
                    url: youtubeUrl,
                    color: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navBarChild(
      {required String name,
      required IconData icon,
      required String url,
      required Color color}) {
    return InkWell(
      onTap: () {
        launch(url);
      },
      child: Column(
        children: [
          FaIcon(
            icon,
            color: color,
            size: 22,
          ),
          Text(
            name,
            style: TextStyle(color: color, fontSize: 13),
          )
        ],
      ),
    );
  }

  getSquareItem(
      {required String name, required String url, required Color color}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: WebWidget(
              url: url,
            ),
            type: PageTransitionType.scale,
            alignment: Alignment.center,
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 175,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  getItem() {
    return imgList.map((path) {
      return Builder(
        builder: (BuildContext context) {
          return Image.asset(
            path,
            fit: BoxFit.cover,
          );
        },
      );
    }).toList();
  }
}

class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? backgroundColor;
  final String url;

  const Category(this.url,
      {Key? key, required this.icon, required this.title, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (url == youtubeUrl || url == msgUrl) {
          launchYoutube(url);
        } else {
          Navigator.push(
              context,
              PageTransition(
                  child: WebWidget(
                    url: url,
                  ),
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 1)));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        width: 150,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  launchYoutube(String url) async {
    await launch(url);
  }
}
