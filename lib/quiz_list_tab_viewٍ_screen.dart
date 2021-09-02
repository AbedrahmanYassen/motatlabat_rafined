import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:motatlabat/QuizezList.dart';
import 'package:motatlabat/inforamation.dart';
import 'package:motatlabat/links_page.dart';

class QuizListTabViewScreen extends StatefulWidget {
  CourseData coursData;

  QuizListTabViewScreen({Key key, @required this.coursData}) : super(key: key);

  @override
  _QuizListTabViewScreenState createState() => _QuizListTabViewScreenState();
}

class _QuizListTabViewScreenState extends State<QuizListTabViewScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () {
        setState(
          () {
            print(_tabController.index);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  CourseData courseDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "نظام اختر",
            ),
            Tab(
              text: "نظام بطاقات",
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              QuizListModelLike(
                  courseName: widget.coursData.courseName.toString(),
                  group: widget.coursData.groupName.toString(),
                  currentPageIndex: _tabController.index),
              QuizListModelLike(
                  courseName: widget.coursData.courseName.toString(),
                  group: widget.coursData.groupName.toString(),
                  currentPageIndex: _tabController.index),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AdmobBanner(
              adUnitId: "ca-app-pub-4849143252522829/9346313616",
              adSize: AdmobBannerSize.FULL_BANNER,
            ),
          ),
        ],
      ),
    );
  }
}
/*
if it doesnt work
* QuizezList(widget.coursData.courseName.toString(),
              widget.coursData.groupName.toString(), _tabController.index),
* */
