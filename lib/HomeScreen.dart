import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motatlabat/links_page.dart';
import 'package:motatlabat/quiz_list_tab_view%D9%8D_screen.dart';
import 'FlibCardsList.dart';
import 'QuizezList.dart';
import 'drawer.dart';
import 'resources.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState(/*this.numberOfcourse*/);
}

class _HomeScreenState extends State<HomeScreen> {
  final database = FirebaseDatabase.instance.reference();
  Query _universityRef;
  @override
  void initState() {
    super.initState();
    _universityRef = FirebaseDatabase.instance.reference().child('courses');
  }

  List<String> courseNames;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: 50, left: _screenWidth / 5, right: _screenWidth / 5),
        child: FloatingActionButton.extended(
          backgroundColor: colorBackground,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LinksPage();
            }));
          },
          label: Padding(
            padding: EdgeInsets.only(
              right: 30,
              left: 30,
            ),
            child: Text(' شاشة الراوابط '),
          ),
        ),
      ),
      drawer: Drawer(
        child: DrawerWid(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        // backgroundColor: itemsColor,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: itemsColor,
          ),
          SizedBox(
            width: _screenWidth,
            height: _screenHeight * 0.75,
            child: FirebaseAnimatedList(
              defaultChild: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        width: _screenWidth * 0.8,
                        height: _screenHeight * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: itemsColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "من فضلك انتظر قليلا مع التاكد من الاتصال بالانترنت",
                              style: TextStyle(color: itemsColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(
                                " استغل وقتك في حفظ كلمات القران الكريم المطلوبة",
                              ),
                              leading: FaIcon(FontAwesomeIcons.car),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return FlubCardsList();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              query: _universityRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map data = snapshot.value;
                return Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                  child: Card(
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(
                            top: 30, bottom: 30, right: 10, left: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data["course_name"],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ]),
                      ),
                      tileColor: colorBackground,
                      onTap: () {
                        if (data["course_group"] == "group*") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FlubCardsList();
                              },
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return QuizListTabViewScreen(
                                    coursData: new CourseData(
                                        groupName: data["course_group"],
                                        courseName: data["course_name"]));
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AdmobBanner(
              adUnitId: "ca-app-pub-3940256099942544/6300978111",
              adSize: AdmobBannerSize.SMART_BANNER(context),
            ),
          ),
        ],
      ),
    );
  }
}
