


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellness_flow_admin/services/mobility_services.dart';

import '../services/meditation_services.dart';

class MobilityController extends GetxController {

  TextEditingController get title => _title;
  final TextEditingController _title = TextEditingController();

  TextEditingController get description => _description;
  final TextEditingController _description = TextEditingController();


  RxBool loading = false.obs;

  RxBool verificationStatus = false.obs;
  RxBool verifying = false.obs;

  RxString meditationId = "".obs;
  var mobilities = [].obs;

  String getUserToken() {
    // UserController userController = Get.find();
    // var token = userController.getToken();
    var token = "eyJraWQiOiJcL2VOWFFGTzlKYURHMmRKTHllcDdKVmxTVkJNZ2Z3dTZqV1hQZ1VodzVuYz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJiMWFiMDUyMC05MDAxLTcwZWUtMjM3Yy1iYjE2YTQyYjhhZmIiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0yLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMl9GQXZvYW9icHEiLCJjbGllbnRfaWQiOiIybjE0ajFoNnNwNDh1a3BsMzdjdXRxaWRxZiIsIm9yaWdpbl9qdGkiOiJlNmE4MjBiYi04NmZiLTRmNzMtYjU4My00OWYyMjhkMDZiNGQiLCJldmVudF9pZCI6ImVhZGZjYTNjLTQ0OGUtNGY5OC05MzMxLTVlYmQ4NWY2YjE5NSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3NDAzNjA5MzcsImV4cCI6MTc0MDQ0NzMzNywiaWF0IjoxNzQwMzYwOTM3LCJqdGkiOiJmNzIxNDRhOS1iZWJhLTQwY2MtYTczNC00MzBjY2IyN2FlYmUiLCJ1c2VybmFtZSI6ImIxYWIwNTIwLTkwMDEtNzBlZS0yMzdjLWJiMTZhNDJiOGFmYiJ9.LY14r2S9Zuu6J6jkUkxPynLVrNMQNofqxdPGRrhdapuvsrF_CliU9KHJ67J_MmCmC8kXnfxi-D_HgOJEf1O-cjdWYPDDH1rVMcBg8c9GdtahAum5z6fN8jdIV1mmJrlsRcl63Z1PP2HOvknPKSG8288tRY5h4kcGJ_86xJu9IiH46QOq_Eio7wpX5-5MG9JfPNL08HYc3AChmwjHMhcCNpC3G8hYTDJc_NOi-DUBtj-W3AJRM9EpAOz_WxWwGb1q7sfsE8-TEcZ5CvpZVsckHEKA63YYYFj598wc86UBBHsIs7ewHFwkx7w9QD326tP1yjmgfxsJ8_A9eayu37FeRg";
    return token;
  }

  // setDailyCount({hydrationCount, mindfulness, activeEnergy}) async {
  //   // Get.to(() =>  Loading());
  //   loadingStatus.value = true;
  //   MeditationServices.setDailyCount((status, response) {
  //     if (status) {
  //       loadingStatus.value = false;
  //       getMeditationDailyCount();
  //       Get.snackbar("Success!", "Data Logged!");
  //       Get.back();
  //       // setUser(response['token'], email: _email.text);
  //     } else {
  //       loadingStatus.value = false;
  //       Get.back();
  //     }
  //   }, dailyCount: hydrationCount, token: getUserToken());
  // }

  // getMeditationDailyCount() async {
  //   // Get.to(() =>  Loading());
  //   // loadingStatus.value = true;
  //   MeditationServices.getMeditationCount((status, response) {
  //     if (status) {
  //       // loadingStatus.value = false;
  //       meditationId.value = response[0]['id'];
  //       getMeditationInfo();
  //       Get.snackbar("Success!", "Data gotten!");
  //       // setUser(response['token'], email: _email.text);
  //     } else {
  //       // loadingStatus.value = false;
  //       // Get.back();
  //     }
  //   }, token: getUserToken());
  // }

  getAllMobilities() async {
    // Get.to(() =>  Loading());
    // loadingStatus.value = true;
    MobilityServices.getAllMobilities((status, response) {
      if (status) {
        // loadingStatus.value = false;
        mobilities.value = response;
        // Get.back();
        // setUser(response['token'], email: _email.text);
      } else {
        // loadingStatus.value = false;
        // Get.back();
      }
    }, token: getUserToken());
  }


  // updateMeditationDailyCount({hydrationId, count}) async {
  //   // Get.to(() =>  Loading());
  //   loadingStatus.value = true;
  //   MeditationServices.updateMeditationDailyCount((status, response) {
  //     if (status) {
  //       loadingStatus.value = false;
  //       getMeditationInfo();
  //       Get.snackbar("Success!", "Data Logged!");
  //       // setUser(response['token'], email: _email.text);
  //     } else {
  //       loadingStatus.value = false;
  //       // Get.back();
  //     }
  //   }, meditationId: hydrationId, count: count, token: getUserToken());
  // }
  //
  //
  // logMeditation({date, meditationId, minuteSpent}) async {
  //   // Get.to(() =>  Loading());
  //   loadingStatus.value = true;
  //   MeditationServices.logMeditation((status, response) {
  //     if (status) {
  //       loadingStatus.value = false;
  //       confettiController.play();
  //       getMeditationInfo();
  //       Get.snackbar("Success!", "Data Logged!");
  //       // setUser(response['token'], email: _email.text);
  //     } else {
  //       Get.snackbar("Ouch!", "an error occurred!");
  //       loadingStatus.value = false;
  //     }
  //   }, meditationId:meditationId, date: date,  minuteSpent: minuteSpent, token: getUserToken());
  // }
  //
  //
  //

  uploadMobility({image}) async {
    // Get.to(() =>  Loading());
    loading.value = true;
    MobilityServices.createMobility((status, response) {
      if (status) {
        loading.value = false;
        // Get.back();
        Get.snackbar("Success!", "Data Logged!");
        getAllMobilities();
        // setUser(response['token'], email: _email.text);
      } else {
        loading.value = false;
        Get.snackbar("Ouch!", "an error occurred!");
      }
    }, title: _title.text,  description: _description.text, image: image, token: getUserToken());
  }


// getHydration({fluidType, volume, date}) async {
//   // Get.to(() =>  Loading());
//   loadingStatus.value = true;
//   HydrationServices.logHydration((status, response) {
//     if (status) {
//       loadingStatus.value = false;
//
//       Get.snackbar("Success!", "Data Logged!");
//       Get.back();
//       // setUser(response['token'], email: _email.text);
//     } else {
//       loadingStatus.value = false;
//       Get.back();
//     }
//   }, fluidType: _fluidType.text, date: _date.text, volume: _volume.text, token: getUserToken());
// }




}
