import 'package:flutter/material.dart';

import 'package:sims_ppob_drajatdanuwardana/models/register_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_register.dart';

class RegisterProviders with ChangeNotifier {
  var registerStatus;
  RegisterModels data =
      RegisterModels(email: ' ', fistName: '', lastName: '', password: '');

  bool loading = false;
  ServicesRegister services = ServicesRegister();

  Future<void> getPostData(context, String email, String firstName,
      String lastName, String password) async {
    loading = true;
    data.email = email;
    data.fistName = firstName;
    data.lastName = lastName;
    data.password = password;

    data =
        await services.postData(context, email, firstName, lastName, password);
        registerStatus = services.registerProses;

    loading = false;
    notifyListeners();
  }
}
