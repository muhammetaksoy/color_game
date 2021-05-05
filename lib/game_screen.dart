import 'dart:async';
import 'dart:math';

import 'package:color_game/colors.dart';
import 'package:color_game/game_over_screen.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String option;

  GameScreen(this.option);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Timer timer;
  Timer timeTimer;
  int timeRemain = 60;
  String nextColor;
  int score = 0;
  List<String> colors = [];

  @override
  void initState() {
    super.initState();
    generateColors();
    timer = Timer(Duration(seconds: 60), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameOverScreen(score),
          ));
    });
    timeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeRemain > 0) timeRemain--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Score:" + score.toString(),
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Time:" + timeRemain.toString(),
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              if (nextColor != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(55),
                      decoration: BoxDecoration(
                          color: HexColor.fromHex(nextColor),
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.all(4),
                    )
                  ],
                ),
              SizedBox(
                height: 32,
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount()),
                children: this.colors.map((e) => buildColorWidget(e)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  getCrossAxisCount() {
    if (widget.option == '3x3') return 3;
    if (widget.option == '4x4') return 4;
    if (widget.option == '5x5') return 5;
  }

  void generateColors() {
    final rowCount = getCrossAxisCount();
    final colorsCount = rowCount * rowCount;
    List<String> colors = [];
    for (int i = 0; i < colorsCount; i++) {
      colors.add(randomColor());
    }
    nextColor = colors[Random().nextInt(colorsCount)];
    this.colors = colors;
  }

  Widget buildColorWidget(String e) {
    return InkWell(
      onTap: () {
        if (e == nextColor) {
          setState(() {
            score++;
          });
        }
        generateColors();
      },
      child: Container(
        decoration: BoxDecoration(
            color: HexColor.fromHex(e),
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(4),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timeTimer?.cancel();
  }
}
