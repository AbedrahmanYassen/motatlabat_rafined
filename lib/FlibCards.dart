import 'package:flutter/material.dart';
import 'package:motatlabat/FlibCardsList.dart';
import 'package:motatlabat/resources.dart';

class FlipCards extends StatefulWidget {
  List<String> _theWord;
  List<String> _theMeaining;
  List texts;
  int numberOfCards;
  String courseName;
  String group;
  FlipCards(this._theWord, this._theMeaining, this.numberOfCards,
      this.courseName, this.texts);
  @override
  _FlipCardsState createState() =>
      _FlipCardsState(/*this._theWord, this._theMeaining, this.cardsCode */);
}

class _FlipCardsState extends State<FlipCards> {
  bool checkOrientation() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return true;
    } else {
      return false;
    }
  }

  TextStyle _wordsStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(86, 101, 115, 1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FlubCardsList();
              },
            ),
          );
        },
        child: Text("للخلف"),
      ),
      appBar: AppBar(
        // leading: Text(" "),
        centerTitle: true,
        title: Text(
          widget.courseName,
          style: appBarTextStyle,
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: sideWide,
                  child: Column(
                    children: [
                      Text(
                        widget._theWord[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      ExpansionTile(
                        collapsedIconColor: Colors.white,
                        textColor: sideWide,
                        backgroundColor: sideWide2,
                        iconColor: Colors.white,
                        title: Text(
                          "المعنى",
                          style: _wordsStyle,
                        ),
                        children: [
                          Text(
                            widget._theMeaining[index],
                            style: _wordsStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: widget._theMeaining.length,
          ),
        ],
      ),
    );
  }
}
