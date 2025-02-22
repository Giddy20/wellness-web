import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wellness_flow_admin/controllers/meditation_controller.dart';
import 'package:wellness_flow_admin/helpers/widgets.dart';
import 'package:wellness_flow_admin/screens/mobility/widgets/add_new_mobility.dart';
import 'package:wellness_flow_admin/screens/mobility/widgets/mobility_details.dart';
// import 'package:wellness_flow_admin/screens/Meditation/widgets/add_new_meditation_audio_dialog.dart';

import '../../helpers/audio_player.dart';
import '../../src/constants.dart';
import '../../src/responsive.dart';




class Mobility extends StatefulWidget {

  @override
  State<Mobility> createState() => _MobilityState();
}

class _MobilityState extends State<Mobility> {

  MeditationController meditationController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobilityController.getAllMobilities();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mobility',
                style: poppinsTextFont.copyWith(
                  fontSize: 20.sp,
                ),),
              verticalSpace(0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() =>  MeditationStatWidget(title: "Total Mobility\nTasks", value: "${meditationController.meditationAudios.length}", icon: Icons.people_alt)),
                      // MeditationStatWidget(title: "Total Revenue", value: "\$123,890", icon: Icons.attach_money),
                      // MeditationStatWidget(title: "Subscribers", value: "13,890", icon: Icons.subscriptions),
                    ],
                  ),

                  verticalSpace(0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mobility Tasks',
                        style: poppinsTextFont.copyWith(
                          fontSize: 13.sp,
                        ),),

                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: (){
                          addNewMobility(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
                          margin: EdgeInsets.symmetric(horizontal: 8.sp),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade800,
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add, size: 17.sp,),
                              horizontalSpace(0.01),
                              Text('Create New',
                                style: poppinsTextFont.copyWith(
                                  fontSize: 11.sp,
                                ),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  // RecentFiles(),
                 Center(
                    child: Obx(() => mobilityController.mobilities.isEmpty ? LoadingAnimationWidget.waveDots(size: 30, color: Colors.teal.shade900) :
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: mobilityController.mobilities.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.5,
                            crossAxisSpacing: 10.sp
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              mobilityDetails(context, mobilityController.mobilities[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                              decoration: BoxDecoration(
                                  color: bgLightColor,
                                  borderRadius: BorderRadius.circular(12.sp)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: ClipRRect(
                                      child: Container(
                                        // width: width() * 0.08,
                                        height: height(),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.sp),
                                          image: DecorationImage(
                                            image:  Image.network(mobilityController.mobilities[index]['image'].toString(), width: 100.sp, ).image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),),
                                  ),
                                  horizontalSpace(0.01),
                                  Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(mobilityController.mobilities[index]['title'],
                                          style: poppinsTextFont.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          verticalSpace(0.01),
                                          Text(mobilityController.mobilities[index]['description'],
                                            maxLines: 3,
                                            style: poppinsTextFont.copyWith(
                                                fontSize: 8.sp,
                                            ),),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        }),
                    ),),

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
      ),
    );
  }
}

class MeditationStatWidget extends StatelessWidget {
  String? title;
  IconData? icon;
  String? value;

  MeditationStatWidget({
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
              Text(title!,
                style: poppinsTextFont.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700
                ),),
            ],
          ),
          verticalSpace(0.05),
          Text(value!,
            style: poppinsTextFont.copyWith(
              fontSize: 13.sp,
            ),),
        ],
      ),
    );
  }
}