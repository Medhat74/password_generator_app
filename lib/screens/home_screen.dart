import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentSliderValue = 8.0;
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebfffd),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.white,
                child: Text(
                  password,
                )),
            Text("Password legnth"),
            Row(
              children: [
                Slider(
                  min: 0,
                  max: 16,
                  value: _currentSliderValue,
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                Container(
                    color: Colors.white,
                    child: Text("${_currentSliderValue.toInt()}"))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  GeneratePassword();
                },
                child: Text("Generate Password"))
          ],
        ),
      ),
    );
  }

  GeneratePassword() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    setState(() {
      print(_currentSliderValue.toInt());
      password = getRandomString(_currentSliderValue.toInt());
      print(password);
    });
  }
}
