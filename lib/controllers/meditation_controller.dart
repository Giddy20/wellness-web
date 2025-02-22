


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/meditation_services.dart';

class MeditationController extends GetxController {
  TextEditingController get title => _title;
  final TextEditingController _title = TextEditingController();

  TextEditingController get meditationType => _meditationType;
  final TextEditingController _meditationType = TextEditingController();

  TextEditingController get date => _date;
  final TextEditingController _date = TextEditingController();


  RxBool audioUploading = false.obs;

  RxBool loadingStatus = false.obs;

  RxBool verificationStatus = false.obs;
  RxBool verifying = false.obs;

  RxString meditationId = "".obs;
  var meditationAudios = [].obs;

  String getUserToken() {
    // UserController userController = Get.find();
    // var token = userController.getToken();
    var token = "eyJraWQiOiJcL2VOWFFGTzlKYURHMmRKTHllcDdKVmxTVkJNZ2Z3dTZqV1hQZ1VodzVuYz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJmMTBiNjUzMC0xMDQxLTcwZjMtMThiMS0zYTk2MTQ2YjA2YTQiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0yLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMl9GQXZvYW9icHEiLCJjbGllbnRfaWQiOiIybjE0ajFoNnNwNDh1a3BsMzdjdXRxaWRxZiIsIm9yaWdpbl9qdGkiOiJmNzkzOTZhZC1hYmQ5LTQyZTMtYjkwMy0xYzllNjc5YzRlZGEiLCJldmVudF9pZCI6ImExYzhkZmViLWVlYzktNDI0Mi1iZTQxLTFkNDA1YTIyNzIxNiIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3Mjk1MDMwNDAsImV4cCI6MTcyOTU4OTQ0MCwiaWF0IjoxNzI5NTAzMDQwLCJqdGkiOiIzMzUxNDA3Mi02NzhjLTRjYTQtYjdhNi1jOGQyNTk2ZTkxYmMiLCJ1c2VybmFtZSI6ImYxMGI2NTMwLTEwNDEtNzBmMy0xOGIxLTNhOTYxNDZiMDZhNCJ9.fBaWmqNjMXfUDOR7_grVg6fk16pCzLDx41hjeyca7qk8d-BIP1doseMAoZf0b3JbpTkrFdB27O4q8jPS2xY13ZYp2d7ptKl5ispl4i9UmwAeU8C4e886y-KrXK5vqYsHmXyQRpVDd2oB5D4CfC0JP6rNeo7wXBXGDHCnXON9uLL65-qFmXnREP30fG6xOQZo7X8pnjw7an7H8dT6_L-Aek0jaIBibIwCDIMXe346ZUIA4yNqyz_qNsv6xfR21tF6KrL60UzdI--CgI7mWbPccEElO7MwpeQ_7QoTlxiwIWZioYWiaAkA9ebVzFBkNeChc9h_fGJ2RyyFJ4zcO5SxUQ";
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

  getAllMeditationAudios() async {
    // Get.to(() =>  Loading());
    // loadingStatus.value = true;
    MeditationServices.getAllMeditationAudio((status, response) {
      if (status) {
        // loadingStatus.value = false;
        meditationAudios.value = response;
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

  uploadMeditationAudio({audio, image, title, meditationType}) async {
    // Get.to(() =>  Loading());
    audioUploading.value = true;
    MeditationServices.uploadMeditationAudio((status, response) {
      if (status) {
        audioUploading.value = false;
        // Get.back();
        Get.snackbar("Success!", "Data Logged!");
        getAllMeditationAudios();
        // setUser(response['token'], email: _email.text);
      } else {
        audioUploading.value = false;
        Get.snackbar("Ouch!", "an error occurred!");
      }
    }, meditationType:meditationType, title: _title.text,  image: image, audio: audio, token: getUserToken());
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
