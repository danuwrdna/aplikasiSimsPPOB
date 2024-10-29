import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/models/banner_models.dart';


import 'package:sims_ppob_drajatdanuwardana/services/services_banner.dart';



class BannerProviders with ChangeNotifier {
  BannerModels data = BannerModels();

  bool loading = false;
  ServicesBanner services = ServicesBanner();

  Future<void> getPostData(context, String token) async {
    loading = true;

    data = await services.getData(context, token);

    loading = false;

    notifyListeners();
  }
}
