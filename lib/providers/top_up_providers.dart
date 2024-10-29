import 'package:flutter/material.dart';

import 'package:sims_ppob_drajatdanuwardana/models/topUp_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_top_up.dart';

class TopUpProviders with ChangeNotifier {
  TopupModels data =
      TopupModels(topUpAmount: '',);
  var topupStatus;
  var bearerTokenLogin;
  bool loading = false;
  ServicesTopUp services = ServicesTopUp();

  Future<void> getPostData(context, String topUp, String token) async {
    loading = true;

   data.topUpAmount = topUp;

    data = await services.postData(context, topUp, token);
    topupStatus = services.statusTopup;
    bearerTokenLogin = services.bearerTokenLogin;

    loading = false;

    notifyListeners();
  }
}
