import 'package:flutter/material.dart';
import 'package:task_list_app/projects/travelApp/components/recommended.dart';
import 'package:task_list_app/projects/travelApp/components/top.dart';

import '../components/heading.dart';
import '../components/label_section.dart';
import '../components/search.dart';
import '../utils/styles.dart';

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: medium, top: 50, right: medium),
            child: Column(
              children: [
                const HeadingSection(),
                SizedBox(height: medium),
                const SearchSection(),
                SizedBox(height: medium),
                LabelSection(text: 'Recommended', style: heading1),
                SizedBox(height: medium),
                const Recommended(),
                SizedBox(height: medium),
                LabelSection(text: 'Top Destination', style: heading2),
                SizedBox(height: medium),
                const Top(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          selectedItemColor: accent,
          unselectedItemColor: icon,
          backgroundColor: white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
