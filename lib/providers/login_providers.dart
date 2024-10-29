import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/models/login_models.dart';
import 'package:sims_ppob_drajatdanuwardana/services/services_login.dart';

class LoginProvider with ChangeNotifier {
  LoginModels data =
      LoginModels(email: ' user@nutech-integrasi.com', password: 'abcdef1233');
  var loginStatus;
  var bearerTokenLogin;
  bool loading = false;
  ServicesLogin services = ServicesLogin();

  Future<void> getPostData(context, String email, String password) async {
    loading = true;

    data.email = email;
    data.password = password;

    data = await services.postData(context, email, password);
    loginStatus = services.statusLogin;
    bearerTokenLogin = services.bearerTokenLogin;

    loading = false;

    notifyListeners();
  }
}
