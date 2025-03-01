import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Swipeimage extends StatelessWidget {
  const Swipeimage({super.key});

  @override
  Widget build(BuildContext context) {
    List image=['assets/home1.jpg','assets/home.jpg','assets/home2.jpg','assets/home3.jpg','assets/home4.jpg'];

    return Container(
      width: double.infinity,
      height: 350,
      child: Swiper(
        itemBuilder:
            (BuildContext context, int index) =>
                Image.asset(image[index], fit: BoxFit.fill),
        autoplay: true,
        itemCount: image.length,
      ),
    );
  }
}
