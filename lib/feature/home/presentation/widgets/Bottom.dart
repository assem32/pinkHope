import 'package:flutter/material.dart';

class BottomScreen extends StatelessWidget {
  const BottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Image.asset('assets/splash.png',width: 100,height: 100,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'This app is just a machine learning model and can\'t replace the doctor it just recommend for you and it is just predection',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
  }
}