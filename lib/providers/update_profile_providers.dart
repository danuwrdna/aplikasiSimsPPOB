import 'package:flutter/material.dart';

import 'package:sims_ppob_drajatdanuwardana/models/update_profiles_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_update_profile.dart';

class UpdateProfileProviders with ChangeNotifier {
  UpdateProfilesModels data = UpdateProfilesModels(firstName: '', lastName: '');
  var topupStatus;
  var bearerTokenLogin;
  bool loading = false;
  ServicesUpdateProfile services = ServicesUpdateProfile();

  Future<void> getPostData(
      context, String fisrtNamee, String lastName, String token) async {
    loading = true;

    data.firstName = fisrtNamee;
    data.lastName = lastName;

    data = await services.postData(context, fisrtNamee, lastName, token);
    topupStatus = services.statusTopup;
    bearerTokenLogin = services.bearerTokenLogin;

    loading = false;

    notifyListeners();
  }
}
