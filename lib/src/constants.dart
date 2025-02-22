import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF202333);
const bgLightColor = Color(0xFF292D3F);

const defaultPadding = 16.0;

smallHSpace() => const SizedBox(width: 20);
tinyHSpace() => const SizedBox(width: 10);
smallSpace() => const SizedBox(height: 20);
tinySpace() => const SizedBox(height: 10);
tiny15Space() => const SizedBox(height: 15);
tiny5Space() => const SizedBox(height: 5);
tinyH5Space() => const SizedBox(width: 5);
mediumSpace() => const SizedBox(height: 30);
mediumHSpace() => const SizedBox(width: 30);


double height() => Get.height;
double width() => Get.width;

Widget kSpacing =  const SizedBox(height: 10,);
Widget kLargeSpacing =  const SizedBox(height: 30,);

verticalSpace(factor) => SizedBox(height: height() * factor);
horizontalSpace(factor) => SizedBox(width: width() * factor);


TextStyle poppinsTextFont = GoogleFonts.poppins().copyWith(
  fontSize: 12.sp,
);