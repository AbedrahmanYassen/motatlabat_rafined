import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motatlabat/dashboard.dart';
import 'package:motatlabat/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UniversitiesScreen extends StatefulWidget {
  const UniversitiesScreen({Key key}) : super(key: key);

  @override
  _UniversitiesScreenState createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'صفحة الجامعات',
          style: appBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: List.generate(universitiesData.length, (index) {
            return Container(
              width: screenWidth,
              height: screenHeight * 0.2,
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      _updateSeen();
                      _saveIndex(index);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FlexibleDahsboardScreen(universitiesData[index]);
                      }));
                    },
                    title: Text(universitiesData[index].universityName),
                    trailing: FaIcon(
                      FontAwesomeIcons.university,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  void _saveIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('index', index);
  }
}
