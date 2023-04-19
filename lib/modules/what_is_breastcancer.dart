import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatIs extends StatelessWidget {
  const WhatIs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What is breast cancer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text('Cancer is a broad term for a class of diseases characterized by abnormal cells that grow and invade  healthy cells in the body.  Breast cancer starts in the cells of the breast as a group of cancer cells that can then invade surrounding tissues or spread (metastasize) to other areas of the body.'))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset('assets/cancer-cell-reproduction-what-is-cancer.jpeg'),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(child: Text('Cancer begins in the cells which are the basic building blocks that make up tissue. Tissue is found in the breast and other parts of the body.  Sometimes, the process of cell growth goes wrong and new cells form when the body doesn’t need them and old or damaged cells do not die as they should.  When this occurs, a build up of cells often forms a mass of tissue called a lump, growth, or tumor.Breast cancer occurs when malignant tumors develop in the breast.  These cells can spread by breaking away from the original tumor and entering blood vessels or lymph vessels, which branch into tissues throughout the body. When cancer cells travel to other parts of the body and begin damaging other tissues and organs, the process is called metastasis.'))
              ],
            ),
            TextButton(onPressed: ()async{
              await launchUrl(
                  Uri.parse('https://www.youtube.com/watch?v=rEV_bc32HaY&t=2s'),
                  mode: LaunchMode.externalApplication
              );
            }, child: Text('more explanation video click here '))
          ],
        ),
      ),
    );
  }
}
