import 'package:flutter/material.dart';

import 'package:sims_ppob_drajatdanuwardana/models/transaksi_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_transaksi.dart';

class TransaksiProviders with ChangeNotifier {
   late TransaksiModels  data = TransaksiModels();


  bool loading = false;
  ServicesTransaksi services = ServicesTransaksi();

  getPostData(context, String token, int limit) async {
    loading = true;

    data = await services.getData(context, token, limit);
  

    loading = false;

    notifyListeners();
  }
}
