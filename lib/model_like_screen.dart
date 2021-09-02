import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motatlabat/dashboard.dart';
import 'package:motatlabat/drawer.dart';
import 'package:motatlabat/quiz_list_tab_view%D9%8D_screen.dart';
import 'FlibCardsList.dart';
import 'QuizezList.dart';
import 'inforamation.dart';
import 'resources.dart';

class ModellikeList extends StatefulWidget {
  ModellikeList(this._group, this._index, {Key key}) : super(key: key);
  String _group;
  int _index = 0;
  @override
  _ModellikeListState createState() => _ModellikeListState();
}

class _ModellikeListState extends State<ModellikeList> {
  Query _courses;
  @override
  void initState() {
    super.initState();
    _courses = FirebaseDatabase.instance
        .reference()
        .child(/*'courses'*/ widget._group);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FlexibleDahsboardScreen(
                      universitiesData[widget._index]);
                },
              ),
            );
          },
          backgroundColor: Color.fromRGBO(41, 105, 176, 1),
          child: Center(
              child: Text(
            'لوحة تحكم',
            style: TextStyle(fontSize: 13),
          )),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return InforamationScreen();
                          },
                          fullscreenDialog: true));
                },
                icon: Icon(Icons.info))
          ],
          centerTitle: true,
          title: Text(
            'صفحة المساقات',
            style: appBarTextStyle,
          ),
        ),
        drawer: Drawer(
          child: DrawerWid(),
        ),
        backgroundColor: blueLikeColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 60),
              child: Center(
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.9,
                  color: white,
                  child: FirebaseAnimatedList(
                    defaultChild: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.3,
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
                    query: _courses,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      Map data = snapshot.value;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(223, 223, 223, 1),
                          ),
                        ),
                        width: screenWidth * 0.9,
                        height: 100,
                        child: ListTile(
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
                          title: Text(
                            data['course_name'],
                            style: TextStyle(
                                color: Color.fromRGBO(33, 36, 41, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.more_vert,
                            color: Color.fromRGBO(33, 36, 41, 1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                  ),
                  width: screenWidth * 0.9,
                  height: 100,
                  child: ListTile(
                    title: Text(
                      this.courseName[index],
                      style: TextStyle(
                          color: Color.fromRGBO(33, 36, 41, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                      color: Color.fromRGBO(33, 36, 41, 1),
                    ),
                  ),
                );
* */
