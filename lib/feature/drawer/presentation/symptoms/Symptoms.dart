import 'package:breastnew/feature/drawer/presentation/symptoms/widget/SymptomsItem.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({super.key});

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
              SymptomsItem('*Swelling of all or part of a breast (even if no lump is felt)', 'assets/symptoms 5.png'),
              SizedBox(
                height: 20,
              ),
              SymptomsItem('*Skin dimpling (sometimes looking like an orange peel)', 'assets/symptoms 1.png'),
              SizedBox(
                height: 20,
              ),
              SymptomsItem('*Breast or nipple pain', 'assets/symptoms 6.png'),
              SizedBox(
                height: 20,
              ),
              SymptomsItem('*Nipple retraction (turning inward)', 'assets/symptoms 6.png'),
              
              SizedBox(
                height: 20,
              ),
              SymptomsItem('*Nipple or breast skin that is red, dry, flaking, or thickened','assets/symptoms 8.png'),
             
              SizedBox(
                height: 20,
              ),
              SymptomsItem('*Nipple discharge (other than breast milk)', 'assets/symptoms 3.png'),
              
              SizedBox(
                height: 20,
              ),
              SymptomsItem('*Swollen lymph nodes under the arm or near the collar bone ', 'assets/symptoms 7.png'),
              
            ],
          ),
        ),
      ),
    );
  }
}