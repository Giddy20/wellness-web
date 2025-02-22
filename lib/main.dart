import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_flow_admin/screens/main/main_screen.dart';
import 'package:wellness_flow_admin/src/constants.dart';
import 'package:wellness_flow_admin/src/hide_scrollbar.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(720, 1280),
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
          title: 'Wellness Admin',
          scrollBehavior: HideScrollBar().copyWith(scrollbars: false),
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            // canvasColor: secondaryColor,
          ),
          home:  MainScreen(),
        )
    );
  }
}