import 'package:color_game/game_screen.dart';
import 'package:flutter/material.dart';

class OptionSelectScreen extends StatefulWidget {
  @override
  _OptionSelectScreenState createState() => _OptionSelectScreenState();
}

class _OptionSelectScreenState extends State<OptionSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Color Game"),
        backgroundColor: Colors.red,
        centerTitle: true,
        ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Difficulty",
                style: TextStyle(fontSize: 42, color: Colors.purple),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                              builder: (context) => GameScreen('3x3'),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Text(
                          "3x3",
                          style: TextStyle(fontSize: 32, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Card(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.cyan,
                          width: 2.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen('4x4'),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Text("4x4",
                              style:
                                  TextStyle(fontSize: 32, color: Colors.cyan)),
                        ),
                      )),
                  Card(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.deepOrange,
                          width: 2.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen('5x5'),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Text("5x5",
                              style: TextStyle(
                                  fontSize: 32, color: Colors.deepOrange)),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
