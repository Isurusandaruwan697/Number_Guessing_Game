import 'package:flutter/material.dart';

class WrongGuess extends StatelessWidget {
  const WrongGuess({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 181, 176),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
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
          Center(child: Text('Sorry wrong guess. Please try again.')),
        ],
      ),
    );
  }
}
