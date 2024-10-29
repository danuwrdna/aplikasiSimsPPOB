import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/models/pembayaran_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_pembayaran.dart';

class PembayaranProviders with ChangeNotifier {
  PembayaranModels data = PembayaranModels(
    serviceCode: '',
  );
  var pembayaranStatus;
  var bearerTokenLogin;
  bool loading = false;
  ServicesPembayaran services = ServicesPembayaran();

  Future<void> getPostData(context, String serviceCode, String token) async {
    loading = true;

    data.serviceCode = serviceCode;

    data = await services.postData(context, serviceCode, token);
    pembayaranStatus = services.statusPembayaran;
    bearerTokenLogin = services.bearerTokenLogin;

    loading = false;

    notifyListeners();
  }
}
