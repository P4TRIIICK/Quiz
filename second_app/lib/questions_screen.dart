import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/answer_buttom.dart';
import 'package:second_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswer, {super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex ++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 72, 13, 139),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ), 
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(answer, () {answerQuestion(answer);},);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
