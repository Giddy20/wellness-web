import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../helpers/image_picker.dart";
import "../../../helpers/widgets.dart";
import "../../../src/constants.dart";

RxString typeDropDown = 'Under 3 Mins'.obs;
RxString type = '"under_3_mins'.obs;

editMobility(context, {title, description, audioType, image, audio}){
  type.value = audioType;
  if(audioType == "under_3_mins"){
    typeDropDown.value = 'Under 3 Mins';
  }
  else if(audioType == "under_90_secs"){
    typeDropDown.value = 'Under 90 Secs';
  }
  else{
    typeDropDown.value = "sleep";
  }
  showDialog(context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: Container(
              width: width() * 0.4,
              height: height() * 0.85,
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Edit Meditation Audio',
                      style: poppinsTextFont.copyWith(
                          fontSize: 13.sp,
                          color: bgColor
                      ),),

                    Divider(color: Colors.grey.withOpacity(0.2), height: 20.sp,),
                    textFieldTitle(title: "Title"),
                    TextFieldWidget(hint: title),
                    verticalSpace(0.020),
                    textFieldTitle(title: "Description"),
                    TextFieldWidget(hint: description),
                    verticalSpace(0.020),
                    textFieldTitle(title: "Audio Type"),
                    Container(
                      // height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.sp),
                        color: Color(0xFFF6F6F6),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => DropdownButton<String>(
                            value: typeDropDown.value,
                            hint: Text('',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 9
                              ),),
                            iconEnabledColor: bgColor,
                            iconDisabledColor: bgColor,
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 9.sp
                            ),
                            underline: SizedBox(),
                            items: <String>['Under 3 Mins', 'Under 90 Secs', 'sleep'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                  style: poppinsTextFont.copyWith(
                                      fontSize: 9.sp,
                                      color: bgColor,
                                      fontWeight: FontWeight.w600
                                  ),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              typeDropDown.value = value!;
                              if(value == 'Under 3 Mins'){
                                type.value = "under_3_mins";
                              }
                              else if(value == 'Under 90 Secs'){
                                type.value = "under_90_secs";
                              }
                              else{
                                type.value = value;
                              }
                            },
                          ),)
                      ),
                    ),
                    verticalSpace(0.025),
                    Row(
                      children: [

                        Expanded(
                          child: InkWell(
                            onTap: (){
                              // selectFile();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 14.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.sp),
                                color: Color(0xFFF6F6F6),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.image, color: Colors.grey, size: 30.sp,),

                                  Text('Upload Image',
                                    style: poppinsTextFont.copyWith(
                                        fontSize: 8.sp,
                                        color: bgColor
                                    ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(0.015),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.sp),
                              color: Color(0xFFF6F6F6),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.audio_file_outlined, color: Colors.grey, size: 30.sp,),

                                Text('Upload Audio File',
                                  style: poppinsTextFont.copyWith(
                                      fontSize: 8.sp,
                                      color: bgColor
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap:() {
                            Navigator.pop(context);
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
                                Icon(Icons.edit_outlined, size: 17.sp,),
                                horizontalSpace(0.01),
                                Text('Edit',
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
            ),
          )
  );
}