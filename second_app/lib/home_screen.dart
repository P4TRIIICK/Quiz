import 'package:flutter/material.dart';
import 'package:second_app/styled_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen( this.startScreen,{super.key});

  final void Function() startScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(
              height: 60,
            ),
            const StyledText('Learn Flutter the fun way', 28, Colors.white),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              onPressed: startScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const StyledText('Start Quiz', 20, Color.fromARGB(255, 39, 3, 46)),
            ),
          ],
        ),
      ),
    );
  }
}
