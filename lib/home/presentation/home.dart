import 'dart:io';


import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


List image=['assets/home1.jpg','assets/home.jpg','assets/home2.jpg','assets/home3.jpg','assets/home4.jpg'];

class ImagePickerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xffce0058),
            title:  Row(
    
              children: [
                Image.asset('assets/splash.png',width: 25,height: 40,),
                SizedBox(width: 20,),
                Text('Home',style: TextStyle(color: Colors.white),),
              ],
            ),
            actions: [
    
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 350,
                      child: Swiper(
                          itemBuilder: (BuildContext context,int index)=>Image.asset(
                            image[index],
                            fit: BoxFit.fill,
                          ),
                          autoplay: true,
                          itemCount: image.length),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    
                    Material(
                      borderRadius: BorderRadius.circular(26),
                      color: Color(0xffF386A5),
                      child: MaterialButton(
                        onPressed: (){

                        },
                        child: const Text('Select Image'),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async{
                        
                      },
                      child: Text('predict'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
    
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Image.asset('assets/splash.png',width: 100,height: 100,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Center(child: Text('This app is just a machine learning model and can\'t replace the doctor it just recommend for you and it is just predection',    textAlign: TextAlign.center,
                              ))),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
    
                ),
              ),
            ),
          ),
        );
   
  }
}