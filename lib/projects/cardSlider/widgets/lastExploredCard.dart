import 'package:flutter/material.dart';
import 'package:task_list_app/generated/assets.dart';

class LastExploredCard extends StatelessWidget {
  final String name;
  final Color color;

  const LastExploredCard({Key? key, required this.name, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      width: double.infinity,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Stack(
          children: [

            Image.asset(
              'assets/images/others/Signal.png',
            ),
            Positioned(
              top: 32,
              left: 18,
              child: Image.asset(
                  'assets/images/others/Satelite.png',
                  width: 50,
                  height: 100
              ),
            ),
            Align(
              child: Image.asset(
                'assets/images/others/Starts.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              top: 200,
              bottom: 50,
              child: Image.asset(
                'assets/images/others/Moon.png',
              ),
            ),
            Positioned(
              bottom: 130,
              left: 180,
              child: Image.asset(
                'assets/images/others/Astronaut.png',
                height: 80,
                filterQuality: FilterQuality.high,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Avenir',
                        fontSize: 50),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(Assets.imagesRightArrow,width: 60,height: 60,color: color,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
