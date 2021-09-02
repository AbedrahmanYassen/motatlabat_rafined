import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motatlabat/models/link.dart';
import 'package:motatlabat/models/links_of_course.dart';
import 'package:motatlabat/models/links_of_each_major.dart';
import 'package:motatlabat/models/quiz_data.dart';
import 'package:motatlabat/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksPage extends StatefulWidget {
  const LinksPage({Key key}) : super(key: key);

  @override
  _LinksPageState createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  TextStyle _textStyle = new TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle _titleStyle = new TextStyle(
      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold);
  double screenWidth;
  double screenHeight;

  Future lunchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    }
  }

  Query _linksPage = FirebaseDatabase.instance.reference().child('links_page');
  @override
  void initState() {
    super.initState();
    _linksPage = FirebaseDatabase.instance.reference().child('links_page');
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('شاشة الروابط'),
        centerTitle: true,
      ),
      backgroundColor: blueLikeColor,
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.8,
            child: FirebaseAnimatedList(
              defaultChild: Center(
                child: Card(
                  child: Container(
                    color: Colors.white,
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white,
                            width: screenWidth * 0.3,
                            height: screenHeight * 0.15,
                            child: CircularProgressIndicator(
                              strokeWidth: 8,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'من فضلك انتظر قليلاً',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              query: _linksPage,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map data = snapshot.value;
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Card(
                    color: Color.fromRGBO(49, 71, 92, 1),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 15,
                          ),
                          child: Text(
                            (data['major_name'] != null)
                                ? data['major_name']
                                : 'بدون اسم',
                            style: _textStyle,
                          ),
                        ),
                        ExpansionTile(
                          collapsedIconColor: Colors.white,
                          textColor: Colors.blue,
                          iconColor: Colors.white,
                          title: Text(
                            'المساقات الخاصة بهذا تخصص',
                            style: _titleStyle,
                          ),
                          children: [
                            (data['list_of_courses'] == null)
                                ? Text(' ')
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    child: ListView.builder(
                                      itemCount:
                                          (data['list_of_courses'] == null)
                                              ? 0
                                              : data['list_of_courses'].length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 60),
                                          child: SizedBox(
                                              width: screenWidth,
                                              height: 250,
                                              child: ListView(
                                                children: List.generate(
                                                  data['list_of_courses']
                                                      .length,
                                                  (index1) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: ExpansionTile(
                                                        collapsedIconColor:
                                                            Colors.white,
                                                        collapsedTextColor:
                                                            Colors.white,
                                                        collapsedBackgroundColor:
                                                            Colors.blue,
                                                        title: Text(
                                                          (data['list_of_courses']
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'course_name'] ==
                                                                  null)
                                                              ? ' '
                                                              : data['list_of_courses']
                                                                      [index1][
                                                                  'course_name'],
                                                        ),
                                                        subtitle: Text(
                                                          'اضغط لرؤية الروابط المتعلقة بالمساق',
                                                        ),
                                                        children: [
                                                          SizedBox(
                                                            width: screenWidth,
                                                            height: 100,
                                                            child: ListView(
                                                              children:
                                                                  List.generate(
                                                                (data['list_of_courses'][index1]
                                                                            [
                                                                            'list_of_links'] ==
                                                                        null)
                                                                    ? 0
                                                                    : data['list_of_courses'][index1]
                                                                            [
                                                                            'list_of_links']
                                                                        .length,
                                                                (index2) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            15),
                                                                    child: Card(
                                                                      child:
                                                                          ListTile(
                                                                        trailing:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .graduationCap,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                        onTap:
                                                                            () {
                                                                          lunchUrl(
                                                                            (data['list_of_courses'][index1]['list_of_links'][index2]['link'] == null)
                                                                                ? ' '
                                                                                : data['list_of_courses'][index1]['list_of_links'][index2]['link'].toString(),
                                                                          );
                                                                        },
                                                                        tileColor:
                                                                            Colors.lightBlue,
                                                                        title: Text((data['list_of_courses'][index1]['list_of_links'][index2]['links_description'] ==
                                                                                null)
                                                                            ? ' '
                                                                            : data['list_of_courses'][index1]['list_of_links'][index2]['links_description']),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ) /*Card(
                                                child: ListTile(
                                                  tileColor: Color.fromRGBO(
                                                      100, 149, 237, 1),
                                                  title: Text(
                                                    (data['list_of_courses'][index]
                                                                ['course_name'] !=
                                                            null)
                                                        ? data['list_of_courses']
                                                            [index]['course_name']
                                                        : 'بدون اسم',
                                                    style: _textStyle,
                                                  ),
                                                  trailing: FaIcon(
                                                    FontAwesomeIcons.graduationCap,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: () {
                                                    lunchUrl(
                                                      (data['list_of_courses'][index]
                                                                  ['course_link'] !=
                                                              null)
                                                          ? data['list_of_courses']
                                                              [index]['course_link']
                                                          : ' ',
                                                    );
                                                  },
                                                ),
                                              ),*/
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AdmobBanner(
              adUnitId: "ca-app-pub-4849143252522829/6755454079",
              adSize: AdmobBannerSize.FULL_BANNER,
            ),
          ),
        ],
      ),
    );
  }
}
