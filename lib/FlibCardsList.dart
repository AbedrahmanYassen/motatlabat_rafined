import 'dart:ui';

import 'model_like_screen.dart';
import 'resources.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'FlibCards.dart';

class FlubCardsList extends StatefulWidget {
  // List<String> text1;

  //   List<String> theCorrectAnswers;
  // List<String> questions;
  // int numberOfQuestons;
  // List<List<String>> choicesData;
  // List<dynamic> theQuizList;
  @override
  _FlubCardsListState createState() => _FlubCardsListState();
  List<String> quran = [
    'قران 1 ',
    'قران 2',
    'قران 3',
    'قران 4',
  ];

  FlubCardsList();
}

class _FlubCardsListState extends State<FlubCardsList> {
  String courseName;

  //for the next class

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'كلمات القران الكريم',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: blueLikeColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: Center(
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.9,
                color: white,
                child: ListView.builder(
                  itemBuilder: (context, index) {
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
                                return FlipCards(
                                  words[index],
                                  theMeaining[index],
                                  words[index].length,
                                  widget.quran[index],
                                  widget.quran,
                                );
                              },
                            ),
                          );
                        },
                        title: Text(
                          widget.quran[index],
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
                  itemCount: widget.quran.length,
                ),
              ),
            ),
          ),
        ),
      ),
      /*Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: itemsColor,
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              color: Colors.lightGreen,
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.quran[index],
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
                        return FlipCards(
                          words[index],
                          theMeaining[index],
                          words[index].length,
                          courseName,
                          widget.quran,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
          itemCount: widget.quran.length,
        ),
      ]),*/
    );
  }
}
