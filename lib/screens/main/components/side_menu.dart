import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellness_flow_admin/src/constants.dart';

import '../../Meditation/meditation.dart';
import '../main_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgLightColor,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            icon: Icon(Icons.home, color: Colors.white.withOpacity(0.7),),
            press: () {
              pageController.jumpToPage(0);
            },
          ),
          DrawerListTile(
            title: "Users",
            icon: Icon(Icons.people, color: Colors.white.withOpacity(0.7),),
            press: () {},
          ),
          DrawerListTile(
            title: "Meditation",
            icon: Icon(Icons.restart_alt, color: Colors.white.withOpacity(0.7),),
            press: () {
              pageController.jumpToPage(2);
            },
          ),
          DrawerListTile(
            title: "Mobility",
            icon: Icon(Icons.directions_walk, color: Colors.white.withOpacity(0.7),),
            press: () {
              pageController.jumpToPage(3);
            },
          ),
          DrawerListTile(
            title: "Settings",
            icon: Icon(Icons.settings, color: Colors.white.withOpacity(0.7),),
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 10.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}