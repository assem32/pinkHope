import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('if you find any of these symptoms you should see your doctor:',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Swelling of all or part of a breast (even if no lump is felt)',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 5.png',width: 75,height: 100,))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Skin dimpling (sometimes looking like an orange peel)',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 1.png',width: 75,height: 100,))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Breast or nipple pain',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 6.png',width: 75,height: 100,))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Nipple retraction (turning inward)',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 6.png',width: 75,height: 100,))

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Nipple or breast skin that is red, dry, flaking, or thickened',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 8.png',width: 75,height: 100,))

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Nipple discharge (other than breast milk)',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 3.png',width: 75,height: 100,))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex:2,child: Text('*Swollen lymph nodes under the arm or near the collar bone ',style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset('assets/symptoms 7.png',width: 75,height: 100,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
