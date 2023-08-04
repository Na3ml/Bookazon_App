import 'package:booking_app/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'booking_screen.dart';
import 'notifications_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'Favourite_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  int selectedIndex = 0;
  List containScreen = [
    const HomeScreen(),
    const SavedScreen(),
    const BookScreen(),
    const ProfileScreen(),
    const notificationsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: themColor,
          // fixedColor: themColor,
          unselectedItemColor: Color(0xFFA1A1A1),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.calendar), label: "Booking"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "notifications"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.heart), label: "Favourite"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), label: "profile"),
          ]),
    );
  }
}
