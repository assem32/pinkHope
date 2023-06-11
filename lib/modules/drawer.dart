import 'package:breastcancer1/modules/chat_docotr_list/chat_doctor_lsit.dart';
import 'package:breastcancer1/modules/chats/chat.dart';
import 'package:breastcancer1/modules/chats/cubit/cubit.dart';
import 'package:breastcancer1/modules/risk_factor.dart';
import 'package:breastcancer1/modules/symptoms.dart';
import 'package:breastcancer1/modules/what_is_breastcancer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CancerDrawer extends StatelessWidget {
  const CancerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Symptoms()));
              },
              child: ListTile(
                leading: Image.asset('assets/drawer1.png',width: 30,height: 30,),
                title: Text('Symptoms'),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WhatIs()));
              },
              child: ListTile(
                leading: Image.asset('assets/dna.png',width: 30,height: 30,),
                title: Text('What is breast cancer'),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RiskFactor()));
              },
              child: ListTile(
                leading: Image.asset('assets/compliance.png',width: 30,height: 30,),
                title: Text('Risk Factors'),
              ),
            ),
            InkWell(
              onTap: (){
                // receiverId ='msqu32aCqUNOpbAnFjcGEHZg9t03';
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorListScreen()));
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
