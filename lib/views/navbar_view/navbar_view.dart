import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/views/home_view/home_view.dart';
import 'package:test_assignment_app/views/profile_view/profile_view.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = <Widget>[
    HomeView(),
    Container(),
    ProfileView(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    var icons = <Widget>[
      Icon(Octicons.book, color: AppColors.white),
      Icon(FontAwesome.users, color: AppColors.white),
      Icon(FontAwesome.user, color: AppColors.white),
      Icon(Icons.notifications, color: AppColors.white),
      Icon(Icons.settings, color: AppColors.white),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        backgroundColor: AppColors.transparent,
        color: Color(0xffe29f00),
        animationDuration: Duration(milliseconds: 300),
        height: 70,
        items: icons,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
