import 'package:flutter/material.dart';
import 'package:page_guess_game/main.dart';

class CorrectGuess extends StatelessWidget {
  final int number;
  const CorrectGuess({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 245, 205),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Guess Game',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
                'You guessed it correctly. Congradulations. My secret number is,'),
          ),
          SizedBox(height: 20),
          Text(
            '$number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: const Text('Start the game again')),
        ],
      ),
    );
  }
}
