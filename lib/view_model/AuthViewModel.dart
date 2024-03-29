import 'package:flutter/material.dart';
import 'package:mvvm_app/repository/auth_repo.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _myrepo = AuthRepo();

  bool isLoading = false;

  bool get loading => isLoading;

  setloading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> loginapi(dynamic data, BuildContext context) async {
    setloading(true);
    _myrepo.loginApi(data).then((value) {
      setloading(false);
      print(value);
      Utils.flushbarErrorMessage("Successfully login", context);
    }).onError((error, stackTrace) {
      setloading(false);
      print(error.toString());
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }

  Future<void> registerapi(dynamic data, BuildContext context) async {
    _myrepo.registerApi(data).then((value) {
      Utils.flushbarErrorMessage("Successfully register", context);
      Navigator.pushNamed(context, RoutesNames.home);
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}
