import 'dart:async';
import 'dart:convert'; // Import for jsonDecode
import 'package:flutter/material.dart';
import 'package:quiz_app_api/completed.dart';
import 'package:quiz_app_api/options.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List responseData = [];
  int number = 0; // Current question index
  Timer? _timer;
  int _secondRemaining = 15;
  List<String> shuffledOptions = [];
  final int totalQuestions = 10; // Total number of questions
  int correctAnswers = 0; // Count correct answers
  int wrongAnswers = 0; // Count wrong answers

  Future<void> api() async {
    try {
      final response =
          await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['results'];
        setState(() {
          responseData = data;
          updateShuffleOption();
        });
      } else {
        throw Exception("Failed to load questions");
      }
    } catch (error) {
      print("Error loading API data: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    api();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                      color: const Color(0xffA42FC1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 179,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: const Color(0xffA42FC1).withOpacity(.4))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Number of questions already answered
                                Text(
                                  '${number}', // Current question index (0-based)
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                                // Number of remaining questions
                                Text(
                                  '${totalQuestions - number}', // Remaining questions
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            ),
                            Center(
                              child: Text(
                                "Question ${number + 1}/$totalQuestions", // Display current question number
                                style: const TextStyle(
                                  color: Color(0xffA42FC1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(responseData.isNotEmpty &&
                                    number < responseData.length
                                ? responseData[number]['question'] ??
                                    'No Question Available'
                                : 'Loading Question...'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 210,
                    left: 140,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Text(
                          _secondRemaining.toString(),
                          style: TextStyle(
                            color: Color(0xffA42FC1),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Display shuffled options if available
            Column(
              children: (responseData.isNotEmpty &&
                      responseData[number]['incorrect_answers'] != null)
                  ? shuffledOptions.map((option) {
                      return GestureDetector(
                        onTap: () {
                          handleOptionTap(option);
                        },
                        child: Options(option: option.toString()),
                      );
                    }).toList()
                  : [],
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA42FC1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
                onPressed: nextQuestion,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Handle option tap
  void handleOptionTap(String selectedOption) {
    String correctAnswer = responseData[number]['correct_answer'];

    if (selectedOption == correctAnswer) {
      correctAnswers++; // Increment correct answers
    } else {
      wrongAnswers++; // Increment wrong answers
    }
    nextQuestion(); // Move to the next question
  }

  // Navigate to the next question
  void nextQuestion() {
    if (number < responseData.length - 1) {
      setState(() {
        number++;
        updateShuffleOption();
        resetTimer(); // Reset the timer for the next question
      });
    } else {
      completed(); // Go to the completed screen when quiz is finished
    }
  }

  // Navigate to the completed screen and pass the final score
  void completed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Completed(
          correctAnswers: correctAnswers,
          wrongAnswers: wrongAnswers,
          totalQuestions: totalQuestions,
        ),
      ),
    );
  }

  // Shuffle the answer options (correct and incorrect) for each question
  void updateShuffleOption() {
    if (responseData.isNotEmpty && number < responseData.length) {
      setState(() {
        shuffledOptions = shuffledOption(
          [
            responseData[number]['correct_answer'],
            ...(responseData[number]['incorrect_answers'] as List),
          ],
        );
      });
    }
  }

  // Utility function to shuffle the options list
  List<String> shuffledOption(List<String> options) {
    List<String> shuffledOptions = List.from(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  // Start a countdown timer
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_secondRemaining > 0) {
          _secondRemaining--; // Decrease the timer by 1 second
        } else {
          nextQuestion(); // Auto-move to the next question when time runs out
        }
      });
    });
  }

  // Reset the countdown timer for each new question
  void resetTimer() {
    _timer?.cancel(); // Cancel the existing timer
    _secondRemaining = 15; // Reset the timer to 15 seconds
    startTimer(); // Start a new timer
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
