import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'api_docs.dart';
import 'api_scheme.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class MobilityServices {


  // static setDailyCount(
  //     Function callback, {
  //       dailyCount,
  //       token,
  //     }) async {
  //   var data = {"daily_goal": dailyCount,};
  //   var response =
  //   await ApiServices.initialisePostRequest(url: meditationDailyCountUrl, data: data, token: token);
  //   print(response);
  //   if (response is String) {
  //     callback(false, response);
  //   } else {
  //     callback(true, response);
  //   }
  // }

  // static getMeditationCount(
  //     Function callback, {
  //       token,
  //     }) async {
  //   var data = {};
  //   var response =
  //   await ApiServices.initialiseGetRequest(url: meditationDailyCountUrl, token: token);
  //   print(response);
  //   if (response is String) {
  //     callback(false, response);
  //   } else {
  //     callback(true, response);
  //   }
  // }

  static getAllMobilities(
      Function callback, {
        token,
      }) async {
    var data = {};
    var response =
    await ApiServices.initialiseGetRequest(url: mobilityUrl, token: token);
    print(response);
    if (response is String) {
      callback(false, response);
    } else {
      callback(true, response);
    }
  }

  static createMobility(
      Function callback, {
        title,
        description,
        image,
        token,
      }) async {
    var data = {
      "title": title,
      "description": description
    };
    var response =
    await ApiServices.initialisePostMultiPart(data:data, url: mobilityUrl, token: token, image: image, type: "Mobility");
    print(response);
    if (response is String) {
      callback(false, response);
    } else {
      callback(true, response);
    }
  }





// static updateMeditationDailyCount(
//     Function callback, {
//       meditationId,
//       count,
//       token,
//     }) async {
//   var data = {"daily_goal": "$count",};
//   var response =
//   await ApiServices.initialisePatchRequest(url: "$meditationInfoUrl/$meditationId/", data: data, token: token);
//   print(response);
//   if (response is String) {
//     callback(false, response);
//   } else {
//     callback(true, response);
//   }
// }


static createExercise(
    Function callback, {
      title,
      numberOfTimes,
      image,
      techniques,
      token,
    }) async {
  var data = {"title": title, "number_of_times": numberOfTimes, "techniques[0]": techniques};
  var response =
  await ApiServices.initialisePostMultiPart(data:data, url: meditationUrl, token: token, image: image);
  print(response);
  if (response is String) {
    callback(false, response);
  } else {
    callback(true, response);
  }
}



}

