import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motatlabat/FlibCardsList.dart';
import 'package:motatlabat/inforamation.dart';
import 'package:motatlabat/links_page.dart';
import 'package:motatlabat/model_like_screen.dart';
import 'package:motatlabat/resources.dart';

class FlexibleDahsboardScreen extends StatefulWidget {
  UniversitySpecificData _universitySpecificData = new UniversitySpecificData(
    'islamic',
    [
      new DashboardButtonRequiremenst(
        Icon(Icons.clear),
        'test',
        '_description',
        InforamationScreen(),
      )
    ],
  );

  FlexibleDahsboardScreen(this._universitySpecificData);

  @override
  _FlexibleDahsboardScreenState createState() =>
      _FlexibleDahsboardScreenState();
}

class _FlexibleDahsboardScreenState extends State<FlexibleDahsboardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._universitySpecificData._universityName),
        leading: Text(''),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: ListView.builder(
                itemCount:
                    widget._universitySpecificData._requirementsOfButton.length,
                itemBuilder: (context, index) {
                  return _getButton(
                      icon: widget._universitySpecificData
                          ._requirementsOfButton[index]._icon,
                      title: widget._universitySpecificData
                          ._requirementsOfButton[index].title,
                      description: widget._universitySpecificData
                          ._requirementsOfButton[index]._description,
                      nextScreen: widget._universitySpecificData
                          ._requirementsOfButton[index]._nextScreen);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AdmobBanner(
                adUnitId: "ca-app-pub-4849143252522829/4985408534",
                adSize: AdmobBannerSize.FULL_BANNER,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle dashButtonsStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  Widget _getButton(
      {Widget icon, String title, String description, Widget nextScreen}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return nextScreen;
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: dashButtonsStyle,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardButtonRequiremenst {
  Widget _icon;
  String _title;
  String _description;
  Widget _nextScreen;

  Widget get icon => _icon;

  set icon(Widget value) {
    _icon = value;
  }

  DashboardButtonRequiremenst(
      this._icon, this._title, this._description, this._nextScreen);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  Widget get nextScreen => _nextScreen;

  set nextScreen(Widget value) {
    _nextScreen = value;
  }
}

class UniversitySpecificData {
  String _universityName;
  List<DashboardButtonRequiremenst> _requirementsOfButton;

  UniversitySpecificData(this._universityName, this._requirementsOfButton);

  String get universityName => _universityName;

  set universityName(String value) {
    _universityName = value;
  }

  List<DashboardButtonRequiremenst> get requirementsOfButton =>
      _requirementsOfButton;

  set requirementsOfButton(List<DashboardButtonRequiremenst> value) {
    _requirementsOfButton = value;
  }
}
