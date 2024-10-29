import 'package:flutter/material.dart';

import 'package:sims_ppob_drajatdanuwardana/models/services_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_services.dart';

class ServicesProviders with ChangeNotifier {
  ServicesModels data = ServicesModels();

  bool loading = false;
  ServicesServices services = ServicesServices();

  Future<void> getPostData(context, String token) async {
    loading = true;

    data = await services.getData(context, token);

    loading = false;

    notifyListeners();
  }
}
