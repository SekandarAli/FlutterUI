// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_list_app/projects/travelApp/components/top.dart';
import '../../../styles/color.dart';
import '../components/card_top.dart';
import '../models/destination.dart';
import '../utils/styles.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key,required this.name,required this.image,required this.price,});

  String name;
  String image;
  String price;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Destination> destinations = [
      Destination('assets/images/square-1.png', 'Osaka', '80', 'Japan'),
      Destination('assets/images/square-3.png', 'Telaga', '120', 'Bandung'),
      Destination('assets/images/square-1.png', 'Osaka', '80', 'Japan'),
      Destination('assets/images/square-4.png', 'Sunning', '100', 'Civilising'),
      Destination('assets/images/square-1.png', 'Osaka', '80', 'Japan'),
    ];
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.name,
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(26),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 350,
                    width: double.infinity,
                    // margin: EdgeInsets.only(right: medium),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.75),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: small, bottom: medium,right: small,top: small),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: accentLight,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: Center(
                                      child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: accentLight,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  width: 50,
                                  height: 50,
                                  child: Center(
                                    child: Icon(Icons.share,color: Colors.white,),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.name, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "\$${widget.price}",
                                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),
                                      ),
                                      TextSpan(text: '/person',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                Text('About',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(height: 15),
                Text('Modern destination with the sky of the power to the world with the largest see inside it to the space.',style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Colors.black87),),
                SizedBox(height: 15),
                Text('Gallery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(height: 15),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    itemCount: destinations.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var dest = destinations[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 6),
                          Container(
                            decoration: BoxDecoration(
                                color: black,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(dest.image),
                                )),
                            height: 69,
                            width: 69,
                          ),
                          const SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                    ),
                    child: Text(
                      "Book Now",textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
