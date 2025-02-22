import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'api_docs.dart';
import 'api_scheme.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class MeditationServices {





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

  static getAllMeditationAudio(
      Function callback, {
        token,
      }) async {
    var data = {};
    var response =
    await ApiServices.initialiseGetRequest(url: meditationUrl, token: token);
    print(response);
    if (response is String) {
      callback(false, response);
    } else {
      callback(true, response);
    }
  }

  static uploadMeditationAudio(
      Function callback, {
        title,
        meditationType,
        audio,
        image,
        token,
      }) async {
    var data = {
      "title": title,
      "meditation_type": meditationType
    };
    var response =
    await ApiServices.initialisePostMultiPart(data:data, url: meditationUrl, token: token, audio: audio, image: image, type: "Meditation");
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

  // static logMeditation(
  //     Function callback, {
  //       minuteSpent,
  //       date,
  //       meditationId,
  //       token,
  //     }) async {
  //   var data = {"minutes_spent": minuteSpent, "date": date};
  //   var response =
  //   await ApiServices.initialisePostRequest(url: "$meditationInfoUrl/$meditationId/meditate/", data: data, token: token);
  //   print(response);
  //   if (response is String) {
  //     callback(false, response);
  //   } else {
  //     callback(true, response);
  //   }
  // }



}

