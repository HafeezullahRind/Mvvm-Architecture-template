import 'package:mvvm_app/data/network/BaseApiServices.dart';
import 'package:mvvm_app/data/network/NetworkApiServices.dart';

import '../res/app_url.dart';

class AuthRepo {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = _apiService.getPostApiResponse(AppUrl.loginUrl, data);

      return response;
    } catch (e) {
      print(e.toString());
    }
  }
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = _apiService.getPostApiResponse(AppUrl.registerUrl, data);

      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
