import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
import 'package:wellness_flow_admin/screens/Meditation/widgets/add_new_meditation_audio_dialog.dart';




class ApiServices {
  static makePostRequest({apiUrl, data, token}) async {      print('Auth - $token');


  final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (token == null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    } else {
      headers = {
        'accept': 'application/json',
        'token': '$token',
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
    }
    return await http.post(uri, body: jsonString, headers: headers);
  }


  static makeDeleteRequest({apiUrl, data, token}) async {      print('Auth - $token');

  final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (token == null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    } else {
      headers = {
        'accept': 'application/json',
        'token': '$token',
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
    }
    return await http.delete(uri, body: jsonString, headers: headers);
  }

  static makePatchRequest({apiUrl, data, token}) async {      print('Auth - $token');

  final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;

    headers = {
      'accept': 'application/json',
      'token': '$token',
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    return await http.patch(uri, body: jsonString, headers: headers);
  }

  static makeGetRequest({apiUrl, token}) async {      print('Auth - $token');

  var uri = Uri.parse(apiUrl);
    var headers;

    headers = {
    // 'Accept': '*/*',
    'Authorization': 'Bearer $token',
    // HttpHeaders.authorizationHeader: 'Bearer $token',
    'Content-Type': 'application/json'
  };

    return await http.get(uri, headers: headers);
  }

  static initialisePostRequest(
      {required data, required String url, token}) async {
    try {
      print(token);
      print(data);
      print(url);

      http.Response response = await ApiServices.makePostRequest(
          apiUrl: url, data: data, token: token);
      var body = jsonDecode(response.body);
      print(response.statusCode);
      print(response.body);
      print('Res  $url ---- $body');

      if (ApiServices.isRequestSuccessful(response.statusCode)) {
        print('Success');
        return body;
      } else {
        print('i am here now ERROR');
        return ApiServices.handleError(response);
      }
    } catch (e) {
      print('Error - $e');
      if (e.toString().contains('HandshakeException')) {
        return 'Check your internet connection';
      } else {
        return e.toString();
      }
    }
  }

  static initialisePostMultiPart(
      {required data, required String url, token, audio, image, type}) async {

    Map<String, String> headers = {
      'accept': 'application/json',
      'token': '$token',
      'Content-Type': 'multipart/form-data',
      // HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    try {
      print(token);
      print(data['title']);
      print(url);

      var uri = Uri.parse(url);

      var request = http.MultipartRequest("POST", uri);

      request.fields["title"] = data['title'];
      if(type == "Meditation"){
        request.fields["meditation_type"] = data['meditation_type'];
      }
      if(type == "Mobility"){
        request.fields["description"] = data['description'];
      }

      request.headers.addAll(headers);
      if(audio != null){
        request.files.add(await http.MultipartFile('audio', audio.readStream, audio.size, filename: audio.name));
      }
        request.files.add(await http.MultipartFile('image', image.readStream, image.size, filename: image.name));

      var response = await request.send();
      print("ressssss $response");
      String result = await response.stream.bytesToString();
      // response.stream.bytesToString();

      print(result);
      print(response.statusCode);
      print(response.stream);
      print(response.request);


      if (ApiServices.isRequestSuccessful(response.statusCode)) {
        print('Success');
        var body = jsonDecode(result);
        meditationController.getAllMeditationAudios();
        Get.back();

        return body;
      } else {
        print('i am here now ERROR');
        Get.back();
      }
    } catch (e) {
      print('Error - $e');

      if (e.toString().contains('HandshakeException')) {
        return 'Check your internet connection';
      } else {
        return e.toString();
      }
    }
  }

  static initialiseDeleteRequest(
      {required data, required String url, token}) async {
    try {
      print(token);
      print(data);
      print(url);

      http.Response response = await ApiServices.makeDeleteRequest(
          apiUrl: url, data: data, token: token);
      var body = jsonDecode(response.body);
      print(response.statusCode);
      print(response.body);
      print('Res  $url ---- $body');

      if (ApiServices.isRequestSuccessful(response.statusCode)) {
        print('Success');
        return body;
      } else {
        print('i am here now ERROR');
        return ApiServices.handleError(response);
      }
    } catch (e) {
      print('Errororor - $e');

      if (e.toString().contains('HandshakeException')) {
        return 'Check your internet connection';
      } else {
        return e.toString();
      }
    }
  }

  static initialisePatchRequest(
      {required Map<String, dynamic> data, required String url, token}) async {
    // if (await InternetServices.checkConnectivity()) {
    try {
      print(url);
      var response = await ApiServices.makePatchRequest(
          apiUrl: url, data: data, token: token);
      var body = jsonDecode(response.body);
      print('Res  $url ---- $body');

      if (ApiServices.isRequestSuccessful(response.statusCode)) {
        return body;
      } else {
        return ApiServices.handleError(response);
      }
    } catch (e) {
      print(e.toString());

      return e.toString();
    }
    // } else {
    //   return 'Check your internet connection';
    // }
  }

  static initialiseGetRequest({required String url, token}) async {
    // if (await InternetServices.checkConnectivity()) {
    try {
      print('ddf');

      print(url);
      http.Response response = await ApiServices.makeGetRequest(apiUrl: url, token: token);

      print(response.headers);
      print(response.request);
      print(response.statusCode);
      print(response.body);
      var body = jsonDecode(response.body);

      print('dd3f');
      print('Res  $url ---- $body');
      if (ApiServices.isRequestSuccessful(response.statusCode)) {
        return body;
      } else {
        return ApiServices.handleError(response);
      }
    } catch (e) {
      print('Erroror - - - - - $e');

      return e.toString();
    }
  }

  static handleError(http.Response response) {
    var errorMessage = jsonDecode(response.body)['error'] != null
        ? jsonDecode(response.body)['error'].toString()
        : jsonDecode(response.body)['message'] != null
            ? jsonDecode(response.body)['message'].toString()
            : (jsonDecode(response.body)['data'] != null &&
                    jsonDecode(response.body)['data']['detail'] != null)
                ? jsonDecode(response.body)['data']['detail'].toString()
                : (jsonDecode(response.body)['data'] != null &&
                        jsonDecode(response.body)['data']['errors'] != null)
                    ? jsonDecode(response.body)['data']['errors'].toString()
                    : jsonDecode(response.body)['result']['errors'] != null
                        ? jsonDecode(response.body)['result']['errors']
                            .toString()
                        : jsonDecode(response.body)['result']['detail'] != null
                            ? jsonDecode(response.body)['result']['detail']
                                .toString()
                            : 'Failed response';

    print(errorMessage);
    switch (response.statusCode) {
      case 400:
        throw (errorMessage);

      case 401:
        throw 'Unauthorized request - $errorMessage';

      case 403:
        throw 'Forbidden Error - $errorMessage';
      case 404:
        throw 'Not Found - $errorMessage';

      case 422:
        throw 'Unable to process - $errorMessage';

      case 500:
        throw 'Server error - $errorMessage';
      default:
        throw 'Error occurred with code : $response';
    }
  }

  static isRequestSuccessful(int? statusCode) {
    return statusCode! >= 200 && statusCode < 300;
  }
}
