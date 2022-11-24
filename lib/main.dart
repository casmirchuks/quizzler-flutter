import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final int winsScore = 0;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  List<Ink> scoreBoard = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          // flex: 3,
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: Border(),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.green,
                    shape: Border(),
                  ),
                  child: TextButton(
                    child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        scoreBoard.add(
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.green,
                              shape: Border(),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.check),
                              color: Colors.white,
                            ),
                          ),
                        );
                        index++;
                        print("Question number: $index" );
                      });
                      //The user picked false.
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.red,
                    shape: Border(),
                  ),
                  child: TextButton(
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        scoreBoard.add(
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.red,
                              shape: Border(),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              color: Colors.white,
                            ),
                          ),
                        );
                        index--;
                        print(index);
                      });
                      //The user picked false.
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: 10,),
        Row(children: scoreBoard)
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

