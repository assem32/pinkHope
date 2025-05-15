import 'package:breastnew/core/AppRouter.dart';
import 'package:breastnew/feature/drawer/presentation/doctors/DoctorsScreen.dart';
import 'package:breastnew/feature/drawer/presentation/riskFactor/RiskFactors.dart';
import 'package:breastnew/feature/drawer/presentation/symptoms/Symptoms.dart';
import 'package:breastnew/feature/drawer/presentation/whatIs/WhatIs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMain extends StatelessWidget {
   DrawerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                AppRouter.router.push("/login/home/symptoms");
              },
              child: ListTile(
                leading: Image.asset('assets/drawer1.png',width: 30,height: 30,),
                title: Text('Symptoms'),
              ),
            ),
            InkWell(
              onTap: (){
                AppRouter.router.push("/login/home/whatis");
              },
              child: ListTile(
                leading: Image.asset('assets/dna.png',width: 30,height: 30,),
                title: Text('What is breast cancer'),
              ),
            ),
            InkWell(
              onTap: (){
                AppRouter.router.push("/login/home/riskfactor");
              },
              child: ListTile(
                leading: Image.asset('assets/compliance.png',width: 30,height: 30,),
                title: Text('Risk Factors'),
              ),
            ),
            InkWell(
              onTap: (){
                // receiverId ='msqu32aCqUNOpbAnFjcGEHZg9t03';
                AppRouter.router.push("/login/home/doctors");
              },
              child: ListTile(
                leading: Image.asset('assets/chat icon.png',width: 30,height: 60,),
                title: Text('Chat with the doctor'),
              ),
            ),
            InkWell(
              onTap: ()async{
                await launchUrl(
                Uri.parse('https://www.nationalbreastcancer.org/'),
                mode: LaunchMode.externalApplication
                );
              },
              child: ListTile(
                leading: Image.asset('assets/splash.png',width: 30,height: 60,),
                title: Text('Read more in National Breast Cancer foundation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}