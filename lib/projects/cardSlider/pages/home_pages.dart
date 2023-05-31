import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/projects/cardSlider/widgets/lastExploredCard.dart';
import '../model/planet_info.dart';
import '../themes/constants.dart';
import '../widgets/card.dart';
import 'details_pages.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.purple,
                  Colors.blue.shade900,
                  Colors.blue,
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/images/others/Signal.png',
          ),
          Align(
            child: Image.asset(
              'assets/images/others/Starts.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SizedBox(
                  // height: constraints.maxHeight * 0.04,
                  child: Text(
                    'Planets',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                  ),
                ),
                // SizedBox(height: constraints.maxHeight * 0.02),
                Expanded(
                  child: Swiper(
                    itemCount: planetInfo.length,
                    itemWidth: MediaQuery.of(context).size.width * 0.85,
                    // itemHeight: MediaQuery.of(context).size.height * 0.9,
                    layout: SwiperLayout.STACK,
                    scrollDirection: Axis.horizontal,
                    axisDirection: AxisDirection.right,
                    pagination: null,
                    outer: true,

                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                          DetailsPage(planetInfo: planetInfo[index])));
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),
                                LastExploredCard(
                                  name: planetInfo[index].name,
                                  color: planetInfo[index].color,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Hero(
                                  tag: planetInfo[index].position,
                                  child: Image.asset(planetInfo[index].iconImage)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
