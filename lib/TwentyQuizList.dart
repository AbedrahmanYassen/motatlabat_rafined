import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_blocked_scroll_physics/horizontal_blocked_scroll_physics.dart';
import 'package:motatlabat/model_like_quiz.dart';

import 'resources.dart';

class TwentyQuizList extends StatefulWidget {
  List theCorrectAnswers = [' '];
  List questions = [' '];
  int numberOfQuestons = 1;
  List choices = [
    [' ', ' ', ' ', ' '],
  ];
  String courseName;
  TwentyQuizList(this.questions, this.choices, this.numberOfQuestons,
      this.theCorrectAnswers, this.courseName);
  @override
  _TwentyQuizListState createState() => _TwentyQuizListState(this.questions,
      this.choices, this.numberOfQuestons, this.theCorrectAnswers);
}

class _TwentyQuizListState extends State<TwentyQuizList> {
  List theCorrectAnswers;
  List questions;
  int numberOfQuestons;
  List choices;
  List<String> insteadOf = [
    'True',
    'False',
  ];

  _TwentyQuizListState(this.questions, this.choices, this.numberOfQuestons,
      this.theCorrectAnswers);
  PageController _controller = PageController();
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double heightWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: blueLikeColor,
      appBar: AppBar(
        title: Text(
          widget.courseName,
          style: appBarTextStyle,
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            physics: RightBlockedScrollPhysics(),
            itemBuilder: (context, index) {
              void _goToOtherScreen() {
                _controller.animateToPage(
                  index + 1,
                  duration: Duration(microseconds: 1),
                  curve: Curves.bounceIn,
                );
              }

              return SingleChildScrollView(
                child: (widget.choices[0][0].toString() == 'True' ||
                        widget.choices[0][0].toString() == 'ch1')
                    ? ModelLikeQuizMultipleChoice(
                        question: widget.questions[index],
                        correctAnswer: widget.theCorrectAnswers[index],
                        choices: insteadOf,
                        questionOrder: wordsOfNumbers[index],
                        function: _goToOtherScreen,
                        appearingText: [
                          'صح',
                          'خطأ',
                        ],
                        index: index,
                        lastIndex: widget.questions.length - 1,
                      )
                    : ModelLikeQuizMultipleChoice(
                        question: widget.questions[index],
                        choices: widget.choices[index],
                        correctAnswer: widget.theCorrectAnswers[index],
                        questionOrder: wordsOfNumbers[index],
                        function: _goToOtherScreen,
                        appearingText: widget.choices[index],
                        index: index,
                        lastIndex: widget.questions.length - 1,
                      ),
              );
            },
            itemCount: questions.length,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AdmobBanner(
              adUnitId: "ca-app-pub-4849143252522829/6755454079",
              adSize: AdmobBannerSize.BANNER,
            ),
          ),
        ],
      ),
    );
  }
}
