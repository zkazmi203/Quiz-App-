import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';
import 'package:flutter_application_1/result.dart';

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
      'questionText': '3*3?',
      'answer': [
        {'text': '9', 'score': 10},
        {'text': '1', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '20', 'score': 0},
      ],
    },
    {
      'questionText': '2+2',
      'answer': [
        {'text': '15', 'score': 0},
        {'text': '54', 'score': 0},
        {'text': '4', 'score': 10},
        {'text': '43', 'score': 0},
      ],
    },
    {
      'questionText': '9+1?',
      'answer': [
        {'text': '80', 'score': 0},
        {'text': '10', 'score': 10},
        {'text': '89', 'score': 0},
        {'text': '90', 'score': 0},
      ],
    },
    {
      'questionText': '1+1?',
      'answer': [
        {'text': '0', 'score': 0},
        {'text': '45', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '2', 'score': 10},
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
    // void _answerQuestion() {
    // bool aval = true;
    // aval = false;

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
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // _questions = []; // will not work if _questions is const

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.purple,
        toolbarHeight: 80,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(9.0),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(0, 2),
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
                      color: const Color.fromARGB(255, 171, 129, 185),
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeColor: Colors.purple),
                ),
              ),
              // Image.asset(
              //   'assests/cat2.gif',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
