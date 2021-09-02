import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motatlabat/universities_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'resources.dart';

class DrawerWid extends StatefulWidget {
  @override
  _DrawerWidState createState() => _DrawerWidState();
}

class _DrawerWidState extends State<DrawerWid> {
  List<String> titles = [];
  List<IconData> icons = [
    FontAwesomeIcons.telegram,
    FontAwesomeIcons.whatsapp,
    FontAwesomeIcons.share
  ];
  Future lunchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    }
  }

  Query _drawer;
  @override
  void initState() {
    super.initState();
    titles = ['تليغرام', 'واتس أب', 'شارك التطبيق'];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(126, 140, 141, 1),
      body: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logoOurs.png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.65,
              child: ListView(
                children: List.generate(
                  titles.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(children: [
                        ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: sideWide,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(icons[index],
                                    color: Color.fromRGBO(41, 105, 176, 1))
                              ]),
                          onTap: () {
                            _actAccordingToIndex(index);
                          },
                        ),
                        Divider(color: Color.fromRGBO(171, 178, 185, 1)),
                      ]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _actAccordingToIndex(int index) {
    switch (index) {
      case 0:
        launch("https://t.me/moayed_harazeen");
        break;
      case 1:
        launch(
            "https://api.whatsapp.com/send/?phone=%2B970594435620&text&app_absent=0");
        break;
      case 2:
        Navigator.pop(context);
        Clipboard.setData(ClipboardData(
            text:
                "https://play.google.com/store/apps/details?id=com.macomp.motatlabat"));
        showToast();

        break;
      default:
        print('nothing gonna happen ');
      //TODO : NEEDED TO BE DELETED
    }
  }

  void showToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم النسخ الى الحافظة'),
        backgroundColor: appBarColor,
      ),
    );
  }
}
