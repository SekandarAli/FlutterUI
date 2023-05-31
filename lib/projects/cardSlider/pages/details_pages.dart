import 'package:flutter/material.dart';
import 'package:task_list_app/generated/assets.dart';
import '../model/planet_info.dart';
import '../themes/constants.dart';

class DetailsPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailsPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: planetInfo.color,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 300,
                        ),
                        Text(
                          planetInfo.name,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white70),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: primaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          planetInfo.description,
                          // maxLines: 5,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 32.0, bottom: 10),
                  //   child: Text(
                  //     'Gallery',
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w600,
                  //         color: contentTextColor),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 250,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 30.0),
                  //     child: ListView.builder(
                  //       itemCount: planetInfo.images.length,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return Card(
                  //           clipBehavior: Clip.antiAlias,
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(32)),
                  //           child: AspectRatio(
                  //               aspectRatio: 1,
                  //               child: Image.network(
                  //                 planetInfo.images[index],
                  //                 fit: BoxFit.cover,
                  //               )),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Positioned(
                right: -100,
                child: Hero(
                    tag: planetInfo.position,
                    child: Image.asset(planetInfo.iconImage))),
            Positioned(
              left: 32,
              top: 60,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                    fontSize: 247,
                    color: primaryTextColor.withOpacity(0.08),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir'),
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(Assets.imagesRightArrow,width: 50,height: 50,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
