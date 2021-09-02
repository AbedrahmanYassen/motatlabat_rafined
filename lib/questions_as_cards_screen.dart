import 'package:flutter/material.dart';

import 'resources.dart';

class QuestionAsCardsScreen extends StatefulWidget {
  List _theQuestion;
  List _choices;
  List _correctValue;
  String courseName;
  QuestionAsCardsScreen(
      this._theQuestion, this._choices, this._correctValue, this.courseName,
      {Key key})
      : super(key: key);

  @override
  _QuestionAsCardsScreenState createState() => _QuestionAsCardsScreenState();
}

class _QuestionAsCardsScreenState extends State<QuestionAsCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseName,
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: blueLikeColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              child: Card(
                color: itemsColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget._theQuestion[index].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    _constructACard(index),
                    ExpansionTile(
                      title: Text(
                        'اضغط لرؤية الاجابة ',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Text(
                          (_getAnswer(index) != null) ? _getAnswer(index) : ' ',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: widget._theQuestion.length,
      ),
    );
  }

  Widget _makeAChoice(
      {int indexOfTheList, int index, String choice1, bool toAddOutSideOrNot}) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          color: sideWide,
          child: Text(
            (toAddOutSideOrNot)
                ? choice1
                : widget._choices[indexOfTheList][index].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _constructACard(int index) {
    if (widget._choices[0][0] == 'ch1' || widget._choices[0][0] == 'True') {
      return Column(
        children: [
          _makeAChoice(
              indexOfTheList: 0,
              index: 0,
              choice1: 'صح',
              toAddOutSideOrNot: true),
          _makeAChoice(
              indexOfTheList: 0,
              index: 1,
              choice1: 'خطأ',
              toAddOutSideOrNot: true)
        ],
      );
    } else {
      return Column(
        children: [
          _makeAChoice(
              indexOfTheList: index, index: 0, toAddOutSideOrNot: false),
          _makeAChoice(
              indexOfTheList: index, index: 1, toAddOutSideOrNot: false),
          _makeAChoice(
              indexOfTheList: index, index: 2, toAddOutSideOrNot: false),
          _makeAChoice(
              indexOfTheList: index, index: 3, toAddOutSideOrNot: false),
        ],
      );
    }
  }

  String _getAnswer(int index) {
    if (widget._correctValue[index].toString() == 'True') {
      return 'صح';
    } else if (widget._correctValue[index].toString() == 'False') {
      return 'خطأ';
    } else {
      return widget._correctValue[index];
    }
  }
}
