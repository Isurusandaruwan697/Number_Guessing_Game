import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_guess_game/correct_guess.dart';
import 'package:page_guess_game/try_over.dart';
import 'package:page_guess_game/wrong_guess.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guess Game',
      theme: ThemeData(
      
        useMaterial3: true,
      ),
      home: StartGame(),
    );
  }
}

class StartGame extends StatefulWidget {
  const StartGame({super.key});

  _startGame createState() => new _startGame();
}

class _startGame extends State<StartGame> {
  String number = "-1";
  int count = -1, _errorCount = 0, guessingNumber = -1;
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: const Text(
          "Guess Game",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              child: Image.asset('assets/detective.jpg'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: double.maxFinite,
              height: 50,
              child: Text(
                  'I have a secret number in my mind(1 - 10). you have 3 chances to guess it can you guess it.'),
            ),
            SizedBox(height: 20),
            Text('${3 - _errorCount} of 3 chances are taken.'),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your guessing number'),
                controller: myController,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count = int.parse(myController.text);
                    _errorCount++;
                  });
                  if (count == guessingNumber && _errorCount < 3) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CorrectGuess(number: this.guessingNumber)));
                  } else if (count != guessingNumber && _errorCount < 4) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WrongGuess()));
                  } else if (_errorCount > 3) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TryOver(guessNumber: this.guessingNumber)));
                    setState(() {
                      _errorCount = 0;
                    });
                  }
                },
                child: Text('Guess'))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    int randomNumber = Random().nextInt(11);
    guessingNumber = randomNumber;
    super.initState();
  }
}
