import 'dart:convert'; // Import for jsonDecode
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app_api/completed.dart';
import 'package:quiz_app_api/options.dart';
import 'package:http/http.dart' as http; // Make sure to fix typo: htpp to http

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List responseData = [];
  int number = 0;

  Future api() async {
    final response =
        await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    api();
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '05',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                                Text(
                                  '07',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            ),
                            const Center(
                              child: Text(
                                "Question 3/10",
                                style: TextStyle(
                                  color: Color(0xffA42FC1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(responseData.isNotEmpty
                                ? responseData[number]['question']
                                : '')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                      bottom: 210,
                      left: 140,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Text(
                            '15',
                            style: TextStyle(
                              color: Color(0xffA42FC1),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Options(option: 'Option A'),
            Options(option: 'Option B'),
            Options(option: 'Option C'),
            Options(option: 'Option D'),
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Completed()),
                  );
                },
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
}
