import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 521,
            width: 400,
            child: Stack(children: [
              Container(
                height: 340,
                width: 410,
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
                                text: const TextSpan(
                                    text: '100',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA42FC1),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' pt',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xffA42FC1)),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
