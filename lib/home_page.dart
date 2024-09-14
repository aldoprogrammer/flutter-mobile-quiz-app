import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(8),
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
                                  offset: Offset(0, 1),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  color:
                                      const Color(0xffA42FC1).withOpacity(.4))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
