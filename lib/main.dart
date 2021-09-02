import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:motatlabat/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'on_boarding.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'resources.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  int index = prefs.getInt('index');
  prefs.setInt('index', 0);
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = IconMovingAnimation();
  } else {
    _screen = FlexibleDahsboardScreen(universitiesData[index]);
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  MyApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: blueLikeColor,
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: appBarColor,
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', ''),
      ],
      debugShowCheckedModeBanner: false,
      home: this._screen,
    );
  }
}
