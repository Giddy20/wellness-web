import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../helpers/image_picker.dart";
import "../../../helpers/widgets.dart";
import "../../../src/constants.dart";

RxString type = 'Under 3 Mins'.obs;

deleteMobility(context, {id}){
  showDialog(context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: Container(
              width: width() * 0.4,
              height: height() * 0.4,
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Delete Meditation Audio',
                    style: poppinsTextFont.copyWith(
                        fontSize: 13.5.sp,
                        color: bgColor
                    ),),

                  verticalSpace(0.05),

                  Text("Are you sure you want to delete this audio?\nYou won't be able to undo this action.",
                    textAlign: TextAlign.center,
                    style: poppinsTextFont.copyWith(
                        fontSize: 9.sp,
                        color: bgColor
                    ),),

                  verticalSpace(0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:() {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
                          margin: EdgeInsets.symmetric(horizontal: 8.sp),
                          decoration: BoxDecoration(
                            // color: Colors.teal.shade800,
                            border: Border.all(color: bgColor, width: 1),
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Row(
                            children: [
                              Text('Cancel',
                                style: poppinsTextFont.copyWith(
                                    fontSize: 11.sp,
                                    color: bgColor
                                ),),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap:() {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
                          margin: EdgeInsets.symmetric(horizontal: 8.sp),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Row(
                            children: [
                              Text('Delete',
                                style: poppinsTextFont.copyWith(
                                  fontSize: 11.sp,
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
  );
}