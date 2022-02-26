import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
  List imgList = [
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Category(
                        "https://tutorprovide.com/",
                        backgroundColor: Colors.pink.withOpacity(opacity),
                        icon: MyIcons.home,
                        title: "HOME".toUpperCase(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Category(
                        "https://tutorprovide.com/login",
                        backgroundColor: Colors.deepOrange.withOpacity(opacity),
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
                        title: "Tutor \nRegistrtion".toUpperCase(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Category(
                        "https://tutorprovide.com/tutorprovide/rft",
                        backgroundColor: Colors.blueAccent.withOpacity(opacity),
                        icon: MyIcons.users,
                        title: "Guardian \nRegistrtion".toUpperCase(),
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
                    ],
                  ),
                ],
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
      {Key? key,
      required this.icon,
      required this.title,
      this.backgroundColor})
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
