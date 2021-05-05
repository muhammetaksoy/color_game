import 'package:flutter/material.dart';

import 'options_select_screen.dart';

class GameOverScreen extends StatefulWidget {
  final int score;

  @override
  _GameOverScreenState createState() => _GameOverScreenState();

  GameOverScreen(this.score);
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Game Over",
              style: TextStyle(fontSize: 96, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.score.toString(),
              style: TextStyle(fontSize: 65,color: Colors.green,fontWeight: FontWeight.bold),
            ),
            Card(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OptionSelectScreen(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Text(
                          "Go To Main Page",
                          style: TextStyle(fontSize: 28, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
