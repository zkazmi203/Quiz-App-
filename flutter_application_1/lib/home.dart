import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';
import 'package:flutter_application_1/result.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  //in question by using MAP
  final _questions = const [
    {
      'questionText': '13 * 3?',
      'answer': [
        {'text': '39', 'score': 10},
        {'text': '14', 'score': 0},
        {'text': '66', 'score': 0},
        {'text': '20', 'score': 0},
      ],
    },
    {
      'questionText': '12 + 2',
      'answer': [
        {'text': '15', 'score': 0},
        {'text': '54', 'score': 0},
        {'text': '14', 'score': 10},
        {'text': '43', 'score': 0},
      ],
    },
    {
      'questionText': '19 - 10?',
      'answer': [
        {'text': '80', 'score': 0},
        {'text': '9', 'score': 10},
        {'text': '89', 'score': 0},
        {'text': '90', 'score': 0},
      ],
    },
    {
      'questionText': '15 / 3?',
      'answer': [
        {'text': '0', 'score': 0},
        {'text': '55', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '5', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Yet We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Q U I Z',
      //     style: GoogleFonts.robotoMono(
      //       textStyle: TextStyle(
      //         color: Colors.white,
      //         fontSize: 30,
      //         // fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Color.fromARGB(255, 55, 71, 79),
      //   toolbarHeight: 80,
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(9.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(0, 142, 141, 143).withOpacity(0.9),
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                LinearProgressBar(
                  maxSteps: _questions.length,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: _questionIndex,
                  progressColor: const Color.fromARGB(255, 55, 71, 79),
                  backgroundColor: Colors.grey[400],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _questionIndex < _questions.length
                      ? Quiz(
                          questions: _questions,
                          answerQuestion: _answerQuestion,
                          questionIndex: _questionIndex,
                        )
                      : Result(_totalScore, _resetQuiz),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: DotsIndicator(
                    dotsCount: _questions.length,
                    position: (_questionIndex < _questions.length)
                        ? _questionIndex.toDouble()
                        : (_questions.length - 1).toDouble(),
                    decorator: DotsDecorator(
                        color: const Color.fromARGB(255, 55, 71, 79),
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        activeColor: const Color.fromARGB(255, 55, 71, 79)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
