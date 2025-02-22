import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";
import "package:wellness_flow_admin/controllers/meditation_controller.dart";

import "../../../helpers/image_picker.dart";
import "../../../helpers/widgets.dart";
import "../../../src/constants.dart";

RxString typeDropDown = 'Under 3 Mins'.obs;
RxString type = '"under_3_mins'.obs;

MeditationController meditationController = Get.find();

addNewMeditationAudio(context){
  showDialog(context: context,
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

        void selectAudio() async {
          final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
          final FilePickerResult? result2 = await FilePicker.platform.pickFiles(type: FileType.audio, withReadStream: true);
          if (result != null) {
            selectedAudio.value = result.files.first.name;
            setState((){
              audio = result.files.first;
              audio2 = result2!.files.first;
            });
          }}

        return AlertDialog(
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
                  Text('Add Meditation Audio',
                    style: poppinsTextFont.copyWith(
                        fontSize: 13.sp,
                        color: bgColor
                    ),),

                  Divider(color: Colors.grey.withOpacity(0.2), height: 20.sp,),
                  textFieldTitle(title: "Title"),
                  TextFieldWidget(hint: "",
                  textController: meditationController.title,),
                  verticalSpace(0.020),
                  textFieldTitle(title: "Description"),
                  TextFieldWidget(hint: "",
                  textController: meditationController.meditationType,),
                  verticalSpace(0.020),
                  textFieldTitle(title: "Audio Type"),
                  Container(
                    // height: 50,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 6.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.sp),
                      color: Color(0xFFF6F6F6),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Obx(() =>
                            DropdownButton<String>(
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
                              items: <String>[
                                'Under 3 Mins',
                                'Under 90 Secs',
                                'Sleep'
                              ].map((String value) {
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
                          child: image != null ? SizedBox(
                          
                            child: Column(
                          
                              mainAxisSize: MainAxisSize.min,
                          
                              children: [
                                Image.memory(image!.bytes!,
                                  height: 80,
                                  width: 80,
                          
                                  fit: BoxFit.cover,
                          
                                ),
                          
                                Text(image!.name,
                                  style: poppinsTextFont.copyWith(
                                      color: Colors.black,
                                    fontSize: 8.sp
                                  ),),
                          
                                verticalSpace(0.015),


                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectImage();
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7.sp, horizontal: 8.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.sp),
                                      color: Colors.teal.shade900,
                                    ),
                                    child: Text('Upload Image',
                                      style: poppinsTextFont.copyWith(
                                          fontSize: 8.sp,
                                          color: Colors.white
                                      ),),
                                  ),
                                ),
                              ],
                          
                            ),
                          
                          ) :
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectImage();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.sp),
                                color: Color(0xFFF6F6F6),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.image, color: Colors.grey,
                                    size: 30.sp,),
                          
                                  Text('Upload Image',
                                    style: poppinsTextFont.copyWith(
                                        fontSize: 8.sp,
                                        color: bgColor
                                    ),),
                                ],
                              ),
                            ),
                          )
                      ),
                      horizontalSpace(0.015),
                      Expanded(
                        child: audio != null ? SizedBox(

                          child: Column(

                            mainAxisSize: MainAxisSize.min,

                            children: [
                              // Audio.memory(audio!.bytes!,
                              //   height: 100,
                              //   width: 100,
                              //
                              //   fit: BoxFit.cover,
                              //
                              // ),

                              Text(audio!.name,
                                style: poppinsTextFont.copyWith(
                                    color: Colors.black,
                                    fontSize: 8.sp
                                ),),

                              verticalSpace(0.015),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectAudio();
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.sp, horizontal: 8.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.sp),
                                    color: Colors.teal.shade900,
                                  ),
                                  child: Text('Upload Audio File',
                                    style: poppinsTextFont.copyWith(
                                        fontSize: 8.sp,
                                        color: Colors.white
                                    ),),
                                ),
                              ),
                            ],

                          ),

                        ) : InkWell(
                          onTap: (){
                            selectAudio();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.sp),
                              color: Color(0xFFF6F6F6),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.audio_file_outlined, color: Colors.grey,
                                  size: 30.sp,),

                                Text('Upload Audio File',
                                  style: poppinsTextFont.copyWith(
                                      fontSize: 8.sp,
                                      color: bgColor
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  verticalSpace(0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     InkWell(
                       onTap: () {
                         meditationController.uploadMeditationAudio(audio: audio2, image: image2, meditationType: type.value);
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(
                             vertical: 10.sp, horizontal: 14.sp),
                         margin: EdgeInsets.symmetric(horizontal: 8.sp),
                         decoration: BoxDecoration(
                           color: Colors.teal.shade800,
                           borderRadius: BorderRadius.circular(12.sp),
                         ),
                         child: Obx(() =>  meditationController.audioUploading.value == true ? Padding(
                           padding: EdgeInsets.symmetric(horizontal: 12.sp),
                           child: LoadingAnimationWidget.waveDots(color: Colors.white, size: 20.sp),
                         )
                             : Row(
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
                     ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      })
  );
}