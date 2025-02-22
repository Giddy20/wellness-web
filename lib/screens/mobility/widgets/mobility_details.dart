import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";
import "package:wellness_flow_admin/controllers/meditation_controller.dart";
import "package:wellness_flow_admin/controllers/mobility_controller.dart";

import "../../../helpers/image_picker.dart";
import "../../../helpers/widgets.dart";
import "../../../src/constants.dart";

RxString typeDropDown = 'Under 3 Mins'.obs;
RxString type = '"under_3_mins'.obs;


mobilityDetails(context, details){
  showModalBottomSheet(context: context,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: width(),
        maxHeight: height() * 0.93
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      builder: (BuildContext context) => StatefulBuilder(
          builder: (context, setState) {
            void selectImage() async {
              final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
              final FilePickerResult? result2 = await FilePicker.platform.pickFiles(type: FileType.image, withReadStream: true);
              if (result != null) {
                selectedImage.value = result.files.first.name;
                setState((){
                  image = result.files.first;
                  image2 = result2!.files.first;
                });
              }}

            return Stack(
              children: [
                Positioned(
                  right: 0,
                  child: BottomSheet(
                    backgroundColor: Colors.transparent,
                    onClosing: (){},
                    enableDrag: false,
                    constraints: BoxConstraints(
                        maxWidth: width(),
                        maxHeight: height() * 0.93
                    ),
                    builder: (BuildContext context) => Container(
                      width: width() * 0.4,
                      height: height() * 0.93,
                      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.sp)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Align(
                              alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: (){
                                      Get.back();
                                    },
                                    icon: Icon(Icons.close, size: 16.sp, color: bgColor,),
                                )),

                            ClipRRect(
                              child: Container(
                                // width: width() * 0.08,
                                  height: height() * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  image: DecorationImage(
                                    image:  Image.network(details['image'].toString(), height: height() * 0.5, width: width() * 0.35, ).image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),),


                            verticalSpace(0.025),

                            Text(details['title'],
                              style: poppinsTextFont.copyWith(
                                  fontSize: 12.sp,
                                  color: bgColor,
                                fontWeight: FontWeight.bold
                              ),),

                            Divider(color: Colors.grey.withOpacity(0.1), height: 15.sp,),

                            Text(details['description'],
                              style: poppinsTextFont.copyWith(
                                  fontSize: 9.sp,
                                  color: bgColor
                              ),),

                            verticalSpace(0.025),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Exercise List",
                                  style: poppinsTextFont.copyWith(
                                      fontSize: 13.sp,
                                      color: bgColor,
                                    fontWeight: FontWeight.bold
                                  ),),

                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: (){
                                    // addNewMobility(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 7.sp),
                                    margin: EdgeInsets.symmetric(horizontal: 8.sp),
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade800,
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add, size: 13.sp,),
                                        horizontalSpace(0.005),
                                        Text('Add New',
                                          style: poppinsTextFont.copyWith(
                                            fontSize: 9.sp,
                                          ),),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),

                            verticalSpace(0.06),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     mobilityController.uploadMobility(image: image2);
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(
                                //         vertical: 10.sp, horizontal: 14.sp),
                                //     margin: EdgeInsets.symmetric(horizontal: 8.sp),
                                //     decoration: BoxDecoration(
                                //       color: Colors.teal.shade800,
                                //       borderRadius: BorderRadius.circular(12.sp),
                                //     ),
                                //     child: Obx(() =>  mobilityController.loading.value == true ? Padding(
                                //       padding: EdgeInsets.symmetric(horizontal: 12.sp),
                                //       child: LoadingAnimationWidget.waveDots(color: Colors.white, size: 20.sp),
                                //     )
                                //         : Row(
                                //       children: [
                                //         Icon(Icons.add, size: 17.sp,),
                                //         horizontalSpace(0.01),
                                //         Text('Create New',
                                //           style: poppinsTextFont.copyWith(
                                //             fontSize: 11.sp,
                                //           ),),
                                //       ],
                                //     ),
                                //     ),
                                //   ),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          })
  );
}