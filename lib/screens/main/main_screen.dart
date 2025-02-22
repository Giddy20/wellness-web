import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellness_flow_admin/screens/Meditation/meditation.dart';
import 'package:wellness_flow_admin/screens/home.dart';
import 'package:wellness_flow_admin/src/constants.dart';

import '../../controllers/meditation_controller.dart';
import '../../controllers/menu_controller.dart';
import '../../controllers/mobility_controller.dart';
import '../../src/responsive.dart';
import '../mobility/mobility.dart';
import 'components/side_menu.dart';

PageController pageController = PageController(initialPage: 3);

class MainScreen extends StatelessWidget {

  MeditationController meditationController = Get.put(MeditationController());
  MobilityController mobilityController  = Get.put(MobilityController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuAppController>().scaffoldKey,
      backgroundColor: bgColor,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(),
                  Container(),
                  Meditation(),
                  Mobility(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}