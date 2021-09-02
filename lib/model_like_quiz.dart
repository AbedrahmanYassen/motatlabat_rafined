import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motatlabat/resources.dart';

class ModelLikeQuizMultipleChoice extends StatefulWidget {
  dynamic question;
  dynamic correctAnswer;
  List<dynamic> choices;
  dynamic questionOrder;
  Function function;
  List appearingText;
  String courseName;
  int index;
  int lastIndex;
  ModelLikeQuizMultipleChoice(
      {@required this.question,
      @required this.correctAnswer,
      @required this.choices,
      @required this.questionOrder,
      @required this.function,
      @required this.appearingText,
      @required this.index,
      @required this.lastIndex,
      Key key})
      : super(key: key);

  @override
  _ModelLikeQuizMultipleChoiceState createState() =>
      _ModelLikeQuizMultipleChoiceState();
}

class _ModelLikeQuizMultipleChoiceState
    extends State<ModelLikeQuizMultipleChoice> {
  var _selectedAnswer;
  List<Widget> appearedIcons = [Text(' '), Text(' '), Text(' '), Text(' ')];
  bool _hasChecked = false;
  String _resultText = ' ';
  Color _resultColor = blueLikeColor;
  String _answeredOrNot = 'لم يتم الاجابة عن هذا السؤال';
  static int result = 0;

  @override
  Widget build(BuildContext context) {
    _clearTheResult();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: blueLikeColor,
                  border: Border.all(
                    color: Color.fromRGBO(225, 225, 225, 1),
                  ),
                ),
                width: screenWidth * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.questionOrder),
                      SizedBox(
                        height: 10,
                      ),
                      Text(_answeredOrNot),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.flag_outlined,
                        color: sideWide,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: blueLikeColor,
                    border: Border.all(
                      color: Color.fromRGBO(225, 225, 225, 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          widget.question.toString(),
                          style: TextStyle(
                            color: Color.fromRGBO(69, 90, 93, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                          children: List.generate(
                        widget.choices.length,
                        (index) {
                          return _getChoice2(
                              value: widget.choices[index],
                              appearingValue: widget.appearingText[index],
                              index: index);
                        },
                      )),
                    ],
                  ),
                ),
              ),
              _showResult(width: screenWidth),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_selectedAnswer != null) {
                          if (_selectedAnswer == widget.correctAnswer &&
                              _hasChecked == false) {
                            _resultText = 'إجابتك صحيحة ';
                            _resultColor = Colors.lightGreen;
                            _hasChecked = true;
                            result += 1;
                          } else if (_selectedAnswer != widget.correctAnswer &&
                              _hasChecked == false) {
                            _resultText = 'إجابتك خاطئة ';
                            _resultColor = Colors.red;
                          }

                          if (widget.index == widget.lastIndex) {
                            _resultText =
                                'إجابتك خاطئة   علامة الكويز  ${result}'; //5
                          }
                          _hasChecked = true;

                          for (int i = 0; i < this.appearedIcons.length; i++) {
                            appearedIcons[i] = Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            );
                            appearedIcons[_getAnswerIndex()] = Icon(
                              Icons.check,
                              color: Colors.lightGreenAccent,
                            );
                            _answeredOrNot = 'تم الاجابة عن هذا السؤال';
                          }
                        } else if (_selectedAnswer == null &&
                            _hasChecked == false) {
                          _resultText = 'من فضلك اختار اجابة ';
                          _resultColor = blueLikeColor;
                        }
                      });
                    },
                    child: Text(
                      'افحص إجابتك',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.function();
                    },
                    child: Text(
                      'الصفحة التالية',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _clearTheResult() {
    if (widget.index == 0) {
      result = 0;
    }
  }

  Widget _getChoice2(
      {@required String value,
      @required String appearingValue,
      @required int index}) {
    return RadioListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              appearingValue,
            ),
          ),
          appearedIcons[index]
        ],
      ),
      groupValue: _selectedAnswer,
      value: value,
      onChanged: (value) {
        setState(() {
          _selectedAnswer = value;
        });
      },
    );
  }

  Widget _showResult({@required double width}) {
    return (!_hasChecked)
        ? Text(' ')
        : Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _resultText,
                  style: TextStyle(
                    fontSize: 20,
                    color: questionsColor,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: _resultColor,
                border: Border.all(
                  color: Color.fromRGBO(225, 225, 225, 1),
                ),
              ),
            ),
          );
  }

  int _getAnswerIndex() {
    for (int i = 0; i < widget.choices.length; i++) {
      if (widget.correctAnswer == widget.choices[i]) {
        return i;
      }
    }
    return 0;
  }
}
