import 'package:breastcancer1/shared/component.dart';
import 'package:flutter/material.dart';

class RiskFactor extends StatelessWidget {
  const RiskFactor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Risk factors'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Did you know that 1 in 8 women will be diagnosed with breast cancer in her lifetime? While you can’t prevent cancer, it is important to be proactive about your health. Get the free Healthy Living and Personal Risk Guide to help you protect your overall health and assess your breast cancer risk.'),
              SizedBox(height: 16,),
              Image.asset('assets/cause.png'),
              SizedBox(height: 16,),
              Text('Cancer grows when a cell’s DNA is damaged, but why or how that DNA becomes damaged is still unknown. It could be genetic or environmental, or in most cases, a combination of the two. But most patients will never know exactly what caused their cancer. However, there are certain established risk factors that are associated with breast cancer.'),
              SizedBox(height: 16,),
              Text('Genetic Factors : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
              SizedBox(
                height: 16,
              ),
              Image.asset('assets/cause1.png',width: double.infinity,height: 200,),
              SizedBox(
                height: 16,
              ),
              ristFactor(first: 'Gender',sec:'Breast cancer occurs nearly 100 times more often in women than in men.' ),
              SizedBox(height: 16,),
              ristFactor(first: 'Age',sec:'Two out of three women with invasive cancer are diagnosed after age 55.' ),
              SizedBox(height: 16,),
              ristFactor(first: 'Race',sec:'  Breast cancer is diagnosed more often in Caucasian women than women of other races.' ),
              SizedBox(height: 16,),

              ristFactor(first: 'Obesity',sec:'Obesity is a risk factor for both men and women.' ),
              SizedBox(height: 16,),

              ristFactor(first: 'Family History and Genetic Factors',sec:'  If your mother, sister, father or child has been diagnosed with breast or ovarian cancer, you have a higher risk of being diagnosed with breast cancer in the future. Your risk increases if your relative was diagnosed before the age of 50.  ' ),
              SizedBox(height: 16,),
              ristFactor(first: 'Personal Health History: ',sec:'If you have been diagnosed with breast cancer in one breast, you have an increased risk of being diagnosed with breast cancer in the other breast in the future. Also, your risk increases if abnormal breast cells have been detected before (such as atypical hyperplasia, lobular carcinoma in situ (LCIS) or ductal carcinoma in situ (DCIS)).' ),
              SizedBox(height: 16,),
              ristFactor(first: 'Menstrual and Reproductive History: ',sec:'Early menstruation (before age 12), late menopause (after 55), having your first child at an older age, or never having given birth can also increase your risk for breast cancer.' ),
              SizedBox(height: 16,),
              ristFactor(first: 'Certain Genome Changes: ',sec:' Mutations in certain genes, such as BRCA1 and BRCA2, can increase your risk for breast cancer. This is determined through a genetic test, which you may consider taking if you have a family history of breast cancer. Individuals with these gene mutations can pass the gene mutation onto their children.' ),
              SizedBox(height: 16,),
              ristFactor(first: 'Dense Breast Tissue: ',sec:' Having dense breast tissue can increase your risk for breast cancer and make lumps harder to detect. Several states have passed laws requiring physicians to disclose to women if their mammogram indicates that they have dense breasts so that they are aware of this risk. Be sure to ask your physician if you have dense breasts and what the implications of  having dense breasts are' ),
              SizedBox(
                height: 16,
              ),
              Text('Environmental And Lifestyle Risk Factors : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
              SizedBox(
                height: 16,
              ),
              Image.asset('assets/cause2.png',width: double.infinity,height: 200,),
              SizedBox(
                height: 16,
              ),
              ristFactor(first: 'Lack of Physical Activity: ',sec: 'A sedentary lifestyle with little physical activity can increase your risk for breast cancer.'),
              SizedBox(
                height: 16,
              ),
              ristFactor(first: 'Poor Diet:  ',sec: 'A diet high in saturated fat and lacking fruits and vegetables can increase your risk for breast cancer. '),
              SizedBox(
                height: 16,
              ),
              ristFactor(first: 'Being Overweight or Obese:  ',sec: 'Being overweight or obese can increase your risk for breast cancer. Your risk is increased if you have already gone through menopause.'),
              SizedBox(
                height: 16,
              ),
              ristFactor(first: 'Drinking Alcohol:  ',sec: 'Frequent consumption of alcohol can increase your risk for breast cancer. The more alcohol you consume, the greater the risk.'),
              SizedBox(
                height: 16,
              ),
              ristFactor(first: 'Radiation to the Chest:  ',sec: 'Having radiation therapy to the chest before the age of 30 can increase your risk for breast cancer.'),
              ristFactor(first: 'Combined Hormone Replacement Therapy (HRT):  ',sec: 'Taking combined hormone replacement therapy, as prescribed for menopause, can increase your risk for breast cancer and increases the risk that the cancer will be detected at a more advanced stage.'),
            ],
          ),
        ),
      ),
    );
  }
}
