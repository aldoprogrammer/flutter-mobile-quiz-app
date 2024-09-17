import 'package:flutter/material.dart';
import 'package:quiz_app_api/home_page.dart';

class Completed extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int totalQuestions;

  const Completed({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double completionRate = totalQuestions > 0
        ? (correctAnswers / totalQuestions * 100).clamp(0, 100)
        : 0;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 521,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 340,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffA42FC1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Colors.white.withOpacity(.4),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Your Score',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffA42FC1),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${completionRate.toStringAsFixed(1)}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA42FC1),
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: ' %',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xffA42FC1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffA42FC1),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42FC1),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                '${completionRate.toStringAsFixed(1)}%',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Color(0xffA42FC1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text('Completion Rate'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42FC1),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                '$totalQuestions',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Color(0xffA42FC1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text('Total Questions'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                '$correctAnswers',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text('Correct Answers'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                '$wrongAnswers',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text('Wrong Answers'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xff37AFA1),
                              radius: 35,
                              child: Center(
                                child: Icon(Icons.refresh,
                                    size: 35, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Play Again',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xffCB9771),
                            radius: 35,
                            child: Center(
                              child: Icon(Icons.visibility_rounded,
                                  size: 35, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Review Answer',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xff37AFA1),
                            radius: 35,
                            child: Center(
                              child: Icon(Icons.share,
                                  size: 35, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Share',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xff37AFA1),
                            radius: 35,
                            child: Center(
                              child: Icon(Icons.file_open_rounded,
                                  size: 35, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Generate PDF',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xffad8ae8),
                              radius: 35,
                              child: Center(
                                child: Icon(Icons.home,
                                    size: 35, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xff5f6a6e),
                            radius: 35,
                            child: Center(
                              child: Icon(Icons.settings_applications,
                                  size: 35, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Leaderboard',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
