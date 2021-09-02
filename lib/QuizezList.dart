import 'dart:ui';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:motatlabat/questions_as_cards_screen.dart';
import 'package:motatlabat/quiz_list_tab_view%D9%8D_screen.dart';

import 'TwentyQuizList.dart';
import 'resources.dart';

/*
class QuizezList extends StatefulWidget {
  List<dynamic> texts;
  int numberOfCards;
  dynamic courseName;
  int courseCode;
  dynamic group;
  List<dynamic> theQuizList;
  int currentPageIndex;
  @override
  _QuizezListState createState() => _QuizezListState(
        this.texts,
        this.courseName,
      );

  QuizezList(this.courseName, this.group, this.currentPageIndex);
}

class _QuizezListState extends State<QuizezList> {
  // List<String> title;
  // int numberOfCards;
  String courseName;

  _QuizezListState(
    this.texts,
    this.courseName,
  );
  //for the next class
  List<dynamic> texts;

  Query _questionsGroups;
  @override
  void initState() {
    super.initState();
    _questionsGroups =
        FirebaseDatabase.instance.reference().child('${widget.group}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.white),
      //   title: Text(
      //     'الذهاب الي لوحة التحكم',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   leading: IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) {
      //               return HomeScreen();
      //             },
      //           ),
      //         );
      //       }),
      // ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: itemsColor
                // image: DecorationImage(
                //     image: ExactAssetImage('assets/images/bg2.png'),
                //     fit: BoxFit.fill),
                ),
          ),
          FirebaseAnimatedList(
            defaultChild: Center(
              child: Container(
                color: Colors.grey,
                width: 300,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: itemsColor,
                      strokeWidth: 10,
                    ),
                    Text(
                      "الرجاء التحقق من  الاتصال بالانترنت",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            query: _questionsGroups,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map data = snapshot.value;
              return Card(
                color: Color.fromRGBO(86, 101, 115, 1),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data["quiz_name"],
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ]),
                  ),
                  tileColor: Color.fromRGBO(86, 101, 115, 1),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (widget.currentPageIndex == 0) {
                            return TwentyQuizList(
                                data["questions"],
                                data["choices"],
                                data["questions"].length,
                                data["answers"]);
                          } else if (widget.currentPageIndex == 1) {
                            return QuestionAsCardsScreen(data["questions"],
                                data["choices"], data["answers"], );
                          }
                        },
                      ),
                    );
                  },
                ),
              );
            },
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
*/
class CourseData {
  dynamic groupName;
  dynamic courseName;
  CourseData({@required this.groupName, @required this.courseName});
}

class QuizListModelLike extends StatefulWidget {
  List<dynamic> texts;
  int numberOfCards;
  dynamic courseName;
  int courseCode;
  dynamic group;
  List<dynamic> theQuizList;
  int currentPageIndex;

  QuizListModelLike(
      {this.courseName, this.group, this.currentPageIndex, Key key})
      : super(key: key);

  @override
  _QuizListModelLikeState createState() => _QuizListModelLikeState();
}

class _QuizListModelLikeState extends State<QuizListModelLike> {
  Query _courses;
  @override
  void initState() {
    super.initState();
    _courses = FirebaseDatabase.instance.reference().child('${widget.group}');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blueLikeColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.9,
              color: white,
              child: FirebaseAnimatedList(
                defaultChild: Center(
                  child: Container(
                    color: sideWide2,
                    width: 300,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: itemsColor,
                          strokeWidth: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " الرجاء التحقق من  الاتصال بالانترنت",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              if (widget.currentPageIndex == 0) {
                                return TwentyQuizList(
                                    data["questions"],
                                    data["choices"],
                                    data["questions"].length,
                                    data["answers"],
                                    widget.courseName);
                              } else if (widget.currentPageIndex == 1) {
                                return QuestionAsCardsScreen(
                                    data["questions"],
                                    data["choices"],
                                    data["answers"],
                                    widget.courseName);
                              }
                            },
                          ),
                        );
                      },
                      title: Text(
                        data['quiz_name'],
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
