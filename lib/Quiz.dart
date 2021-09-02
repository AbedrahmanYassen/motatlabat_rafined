import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'resources.dart';

class Quiz extends StatefulWidget {
  String _theQuestion;
  int lastIndex;
  int index;
  List _choices;
  int numberOfQuestions;
  Quiz(
    this._theQuestion,
    this._choices,
    this._correctValue,
    this.lastIndex,
    this.index,
  );

  String _correctValue;

  @override
  _QuizState createState() => _QuizState(this._theQuestion, this._choices,
      this._correctValue, this.lastIndex, this.index);
}

class _QuizState extends State<Quiz> {
  TextStyle _style = TextStyle(fontSize: 25);
  int lastIndex;
  int indexOutside;
  String _messageToUser = ' ';
  Color _colorOfButton = Colors.yellow;
  static int _result = 0;
  String _valueOfButtons;
  String _theQuestion;
  List _choices;

  _QuizState(this._theQuestion, this._choices, this._correctValue,
      this.indexOutside, this.lastIndex);

  List<Color> _colorsOfButtons = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];
  bool isChecked;
  void _clearTheResult() {
    if (widget.index == 0) {
      _result = 0;
    }
  }

  String _correctValue;
  List<Widget> iconValues = [Text("A"), Text('B'), Text("C"), Text("D")];
  @override
  Widget build(BuildContext context) {
    _clearTheResult();
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: itemsColor),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                _theQuestion,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            _drawButtons(),
          ],
        ),
      ),
    );
  }

  Widget _drawButton(Color color, String content, double width, double height,
      int index, Widget iconValue) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
          ),
          // splashColor: Colors.lightGreen.shade900,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          // color: color,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(content),
            ),
            _makeIcon(iconValue),
          ]),
          onPressed: () {
            try {
              setState(
                () {
                  if (index == 0) {
                    _valueOfButtons = this._choices[0];

                    if (_checkButton()) {
                      iconValues[0] = FaIcon(FontAwesomeIcons.checkCircle);
                      iconValues[1] = Icon(Icons.cancel);
                      iconValues[2] = Icon(Icons.cancel);
                      iconValues[3] = Icon(Icons.cancel);
                      _colorsOfButtons[0] = Colors.lightGreen;
                      _colorsOfButtons[1] = Colors.red;
                      _colorsOfButtons[2] = Colors.red;
                      _colorsOfButtons[3] = Colors.red;
                    } else {
                      _actToWrongResult();
                    }
                  } else if (index == 1) {
                    _valueOfButtons = this._choices[1];
                    if (_checkButton()) {
                      iconValues[1] = FaIcon(FontAwesomeIcons.checkCircle);
                      iconValues[0] = Icon(Icons.cancel);
                      iconValues[2] = Icon(Icons.cancel);
                      iconValues[3] = Icon(Icons.cancel);
                      _colorsOfButtons[1] = Colors.lightGreen;
                      _colorsOfButtons[0] = Colors.red;
                      _colorsOfButtons[2] = Colors.red;
                      _colorsOfButtons[3] = Colors.red;
                    } else {
                      _actToWrongResult();
                    }
                  } else if (index == 2) {
                    _valueOfButtons = this._choices[2];
                    if (_checkButton()) {
                      iconValues[2] = FaIcon(FontAwesomeIcons.checkCircle);
                      iconValues[0] = Icon(Icons.cancel);
                      iconValues[1] = Icon(Icons.cancel);
                      iconValues[3] = Icon(Icons.cancel);
                      _colorsOfButtons[2] = Colors.lightGreen;
                      _colorsOfButtons[1] = Colors.red;
                      _colorsOfButtons[0] = Colors.red;
                      _colorsOfButtons[3] = Colors.red;
                    } else {
                      _actToWrongResult();
                    }
                  } else if (index == 3) {
                    _valueOfButtons = this._choices[3];
                    if (_checkButton()) {
                      iconValues[3] = FaIcon(FontAwesomeIcons.checkCircle);
                      iconValues[1] = Icon(Icons.cancel);
                      iconValues[2] = Icon(Icons.cancel);
                      iconValues[0] = Icon(Icons.cancel);
                      _colorsOfButtons[3] = Colors.lightGreen;
                      _colorsOfButtons[1] = Colors.red;
                      _colorsOfButtons[2] = Colors.red;
                      _colorsOfButtons[0] = Colors.red;
                    } else {
                      _actToWrongResult();
                    }
                  }
                },
              );
            } catch (e) {
              if (widget.index != widget.lastIndex) {
                _showDialog(
                    " ",
                    Text(
                      "انتقل للسؤال التالي",
                      style: _style,
                    ),
                    Colors.blue);
              } else {
                _showDialog(
                    "انتهت الاسئلة",
                    Text(
                      "أجبت على أجبت على ${_result} من ${widget.lastIndex + 1} سؤال",
                      style: _style,
                    ),
                    Colors.blue);
              }
            }
          },
        ),
      ),
    );
  }

  bool _checkButton() {
    if (_valueOfButtons == _correctValue && (isChecked == null)) {
      _result += 1;
      isChecked = true;
      if (widget.index != widget.lastIndex) {
        _showDialog(
            " ",
            Text(
              "الاجابة صحيحة",
              style: _style,
            ),
            Colors.green);
      } else {
        _showDialog(
            "الاجابةالحالية صحيحة",
            Text(
              "أجبت على ${_result}من ${widget.lastIndex + 1} سؤال",
              style: _style,
            ),
            Colors.green);
      }
      return true;
    } else if (isChecked == null && _valueOfButtons != _correctValue) {
      _result += 0;
      isChecked = false;
      _colorsOfButtons[0] = _colorOfButton;
      _colorsOfButtons[1] = _colorOfButton;
      _colorsOfButtons[2] = _colorOfButton;
      _colorsOfButtons[3] = _colorOfButton;
      if (widget.index != widget.lastIndex) {
        _showDialog(
            " ",
            Text(
              "الاجابة خاطئة",
              style: _style,
            ),
            Colors.red);
      } else {
        _showDialog(
            "الاجابةالحالية خاطئة",
            Text(
              "أجبت على أجبت على ${_result} من ${widget.lastIndex + 1} سؤال",
              style: _style,
            ),
            Colors.red);
      }
      return false;
    }
  }

  Widget _drawButtons() {
    try {
      if (widget._choices[0] != "True") {
        return Column(
          children: [
            _drawButton(this._colorsOfButtons[0], this._choices[0], 300, 80, 0,
                iconValues[0]),
            _drawButton(this._colorsOfButtons[1], this._choices[1], 300, 80, 1,
                iconValues[1]),
            _drawButton(this._colorsOfButtons[2], this._choices[2], 300, 80, 2,
                iconValues[2]),
            _drawButton(this._colorsOfButtons[3], this._choices[3], 300, 80, 3,
                iconValues[3]),
          ],
        );
      } else {
        return Column(
          children: [
            _drawButton(
              _colorsOfButtons[0],
              "صح",
              300,
              80,
              0,
              iconValues[0],
            ),
            _drawButton(
              _colorsOfButtons[1],
              "خطأ",
              300,
              80,
              1,
              iconValues[1],
            ),
          ],
        );
      }
    } catch (e) {
      return Container(
        width: 100,
        height: 100,
        color: Colors.white,
        child: Center(child: Text("There are a problem")),
      );
    }
  }

  Widget _makeIcon(Widget choice) {
    return CircleAvatar(
      child: choice,
      backgroundColor: Colors.orange,
      foregroundColor: Colors.yellow,
    );
  }

  int _getTheIndexOfTheTrue() {
    for (int i = 0; i < _choices.length; i++) {
      if (_choices[i] == _correctValue) {
        return i;
      }
    }
    return 0;
  }

  void _actToWrongResult() {
    for (int i = 0; i < _choices.length; i++) {
      iconValues[i] = Icon(Icons.cancel);
      _colorsOfButtons[i] = Colors.red;
    }
    _colorsOfButtons[_getTheIndexOfTheTrue()] = Colors.green[300];
    iconValues[_getTheIndexOfTheTrue()] = FaIcon(FontAwesomeIcons.checkCircle);
  }

  Future<void> _showDialog([String title, Widget child, Color color]) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: color,
          title: Text(title),
          content: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(child: child),
          ),
        );
      },
    );
  }
}
