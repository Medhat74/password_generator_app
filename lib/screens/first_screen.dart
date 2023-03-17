import 'package:flutter/material.dart';
import 'package:session_mobile/enum/game_enum.dart';
import 'package:session_mobile/enum/result_enum.dart';
import 'dart:math';

import '../compenets/item_text.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int counterPlayer = 0;
  int counterCPU = 0;

  GameEnum? userChoice;
  GameEnum? cpuChoice;

  ResultEnum? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b2b4c),
      body: Center(
        child: userChoice == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemText(name: 'Rock'),
                  ItemText(name: 'Paper'),
                  ItemText(name: 'Scissors'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pick your weapon",
                      style: TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          userChoice = GameEnum.rock;
                        });
                        cpuChoiceGenerator();
                        calculateGame();
                      },
                      child: Image.asset("assets/images/rock.png", scale: 18)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(

                        onTap: () {
                          setState(() {
                            userChoice = GameEnum.paper;
                          });
                          cpuChoiceGenerator();
                          calculateGame();
                        },
                        child:
                            Image.asset("assets/images/paper.png", scale: 18)),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          userChoice = GameEnum.scissor;
                        });
                        cpuChoiceGenerator();
                        calculateGame();
                      },
                      child:
                          Image.asset("assets/images/scissor.png", scale: 18)),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Player",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white70)),
                          ItemText(
                            name: "$counterPlayer",
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("CPU",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white70)),
                          ItemText(name: "$counterCPU"),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemText(name: "${result!.name}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ItemText(name: "Player"),
                            Image.asset(
                              "assets/images/${userChoice!.name}.png",
                              scale: 18,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ItemText(name: "Cpu"),
                            Image.asset(
                              "assets/images/${cpuChoice!.name}.png",
                              scale: 18,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          userChoice = null;
                        });
                      },
                      child: ItemText(
                        name: "Play Again",
                      ))
                ],
              ),
      ),
    );
  }

  calculateGame() {
    if (userChoice == GameEnum.rock && cpuChoice == GameEnum.scissor) {
      setState(() {
        counterPlayer++;
        result = ResultEnum.Win;
      });
    }
    if (userChoice == GameEnum.rock && cpuChoice == GameEnum.paper) {
      setState(() {
        counterCPU++;
        result = ResultEnum.Lose;
      });
    }

    if (userChoice == GameEnum.paper && cpuChoice == GameEnum.rock) {
      setState(() {
        counterPlayer++;
        result = ResultEnum.Win;
      });
    }

    if (userChoice == GameEnum.paper && cpuChoice == GameEnum.scissor) {
      setState(() {
        counterCPU++;
        result = ResultEnum.Lose;
      });
    }

    if (userChoice == GameEnum.scissor && cpuChoice == GameEnum.paper) {
      setState(() {
        counterPlayer++;
        result = ResultEnum.Win;
      });
    }

    if (userChoice == GameEnum.scissor && cpuChoice == GameEnum.rock) {
      setState(() {
        counterCPU++;
        result = ResultEnum.Lose;
      });
    }

    if (userChoice == cpuChoice) {
      setState(() {
        result = ResultEnum.Draw;
      });
    }
  }

  cpuChoiceGenerator() {
    Random random = Random();
    int randomNumber = random.nextInt(3);

    setState(() {
      cpuChoice = GameEnum.values[randomNumber];
    });
  }
}
