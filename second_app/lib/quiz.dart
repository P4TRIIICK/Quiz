import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/home_screen.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context){
    Widget screenWidget =  HomeScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionsScreen(chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnswers, switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }

}