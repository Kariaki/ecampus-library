import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpRequest extends GetxController {
  var client = http.Client();
  var headers = {
    'AUTHORIZATION': 'apikey=2353282',
    'Content-Type': 'application/json'
  };

  Future<dynamic> getBrainFriendData() async {
    final response = client
        .get(
            Uri.parse(
                "https://app.brainfriendonline.com/php/api/apiv2/client.min.js"),
            headers: headers)
        .then((value) {
      if (value.statusCode == 200) {
        print(value.statusCode);
      }
    });

    print(response);
    return response;
  }
}
