import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/models/get_profile_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_get_profile.dart';

class GetProfileProviders with ChangeNotifier {
  GetProfileModels data = GetProfileModels();

  bool loading = false;
  ServicesGetProfile services = ServicesGetProfile();


  Future<void> getPostData(context, String token) async {
    loading = true;

    data = await services.getData(context,token );


    loading = false;

    notifyListeners();
  }
}
