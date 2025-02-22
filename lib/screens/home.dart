import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_flow_admin/screens/main/main_screen.dart';

import '../src/constants.dart';
import '../src/responsive.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard',
              style: poppinsTextFont.copyWith(
                fontSize: 20.sp,
              ),),
            verticalSpace(0.03),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DashboardStatWidget(title: "Total Users", value: "23,890", icon: Icons.people_alt),
                    DashboardStatWidget(title: "Total Revenue", value: "\$123,890", icon: Icons.attach_money),
                    DashboardStatWidget(title: "Subscribers", value: "13,890", icon: Icons.subscriptions),
                  ],
                ),
                // MyFiles(),
               // Text('fff'),
                SizedBox(height: defaultPadding),
                // RecentFiles(),
                // Text('fff'),
                if (Responsive.isMobile(context))
                  SizedBox(height: defaultPadding),
                // if (Responsive.isMobile(context)) StorageDetails(),
              ],
            ),
            if (!Responsive.isMobile(context))
              SizedBox(width: defaultPadding),
            // On Mobile means if the screen is less than 850 we don't want to show it
            // if (!Responsive.isMobile(context))
              // Text('fff')
          ],
        ),
      ),
    );
  }
}

class DashboardStatWidget extends StatelessWidget {
  String? title;
  IconData? icon;
  String? value;

   DashboardStatWidget({
    super.key, this.value, this.icon, this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 14.sp),
      margin: EdgeInsets.symmetric(horizontal: 8.sp),
      decoration: BoxDecoration(
        color: bgLightColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon!, size: 25.sp,),
              horizontalSpace(0.02),
              AutoSizeText(title!,
                maxFontSize: 25,
                style: poppinsTextFont.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700
                ),),
            ],
          ),
          verticalSpace(0.05),
          AutoSizeText(value!,
            maxFontSize: 20,
            style: poppinsTextFont.copyWith(
              fontSize: 13.sp,
            ),),
        ],
      ),
    );
  }
}