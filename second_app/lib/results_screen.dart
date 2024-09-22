import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.switchScreen, {super.key});

  final List<String> chosenAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

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
            children: [
              Text(
                'You answered $numCorrectQuestions out $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton(onPressed: switchScreen, child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restart_alt_outlined, color: Colors.white,),
                  Text('Restart Quiz!', style: TextStyle(color: Colors.white),),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
