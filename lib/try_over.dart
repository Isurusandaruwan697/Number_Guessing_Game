import 'package:flutter/material.dart';
import 'package:page_guess_game/main.dart';

class TryOver extends StatelessWidget {
  final int guessNumber;
  const TryOver({super.key, required this.guessNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 229, 239),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
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
          Center(child: Text('Sorry! Game over. the secret number is,')),
          SizedBox(height: 20),
          Center(
              child: Text(
            '$guessNumber',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: Text('Start the game again.'),
          )
        ],
      ),
    );
  }
}
