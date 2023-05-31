import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import '../widget/card_planet.dart';
import 'home_page.dart';

class OnBoardingConcentric extends StatelessWidget {
  OnBoardingConcentric({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "observe",
      subtitle:
          "The night sky has much to offer to those who seek its mystery.",
      image: const AssetImage(Assets.imagesImg1),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset(Assets.lottieBg1),
    ),
    CardPlanetData(
      title: "imagine",
      subtitle: "An endless number of galaxies means endless possibilities.",
      image: const AssetImage(Assets.imagesImg2),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(131, 157, 13, 1.0),
      background: LottieBuilder.asset(Assets.lottieBg3),
    ),
    CardPlanetData(
      title: "stargaze",
      subtitle: "The sky dome is a beautiful graveyard of stars.",
      image: const AssetImage(Assets.imagesImg3),
      backgroundColor: const Color.fromRGBO(195, 255, 0, 1.0),
      titleColor: Colors.purple,
      subtitleColor: Colors.black54,
      background: LottieBuilder.asset(Assets.lottieBg3),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index,) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
    );
  }
}
