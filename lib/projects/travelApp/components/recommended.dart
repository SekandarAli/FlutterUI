import 'package:flutter/material.dart';
import 'package:task_list_app/projects/travelApp/pages/detail_page.dart';
import '../models/destination.dart';
import 'card_rec.dart';


class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    List<Destination> destinations = [
      Destination('assets/images/square-1.png', 'Japan Temple', '120',
          'Osaka Street, japan'),
      Destination('assets/images/square-2.png', 'Capra Mere', '100',
          'Tokyo Street, japan'),
      Destination(
          'assets/images/square-3.png', 'Tela', '80', 'Bandung, japan'),
    ];
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: destinations.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var dest = destinations[index];

          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailPage(name: dest.name,image: dest.image,price: dest.price,)));
            },
            child: Hero(
              tag: dest.name,
              child: CardRecommended(
                  image: dest.image,
                  name: dest.name,
                  price: dest.price,
                  location: dest.location),
            ),
          );
        },
      ),
    );
  }
}
