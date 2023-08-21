import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../booking/booking_screen.dart';
import '../notifications/notifications_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../favourite/favourite_page.dart';

class LayoutsPage extends StatefulWidget {
  const LayoutsPage({super.key});

  @override
  State<LayoutsPage> createState() => _LayoutsPageState();
}

class _LayoutsPageState extends State<LayoutsPage> {
  int selectedIndex = 0;
  List containScreen = [
    const HomePage(),
    const BookingPage(),
    const NotificationsPage(),
    const FavouritePage(),
    const ProfilePage(),
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
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.unSelectedGrey,
        iconSize: 35.w,
        selectedFontSize: 11.sp,
        unselectedFontSize: 11.sp,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month_outlined),
            label: S.of(context).booking,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_outlined),
            label: S.of(context).notificaiton,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outline_rounded),
            label: S.of(context).favourite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
