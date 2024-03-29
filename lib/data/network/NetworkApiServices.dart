import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_app/data/app_exceptions.dart';
import 'package:mvvm_app/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiService {
  dynamic responseJson;
  @override
  Future getGetApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExeption('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExeption('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExeption(response.body.toString());
      case 404:
        throw UnAuthException(response.body.toString());
      default:
        throw FetchDataExeption(
            'Error Occured while communication with server' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
