import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/models/balance_models.dart';

import 'package:sims_ppob_drajatdanuwardana/services/services_balance.dart';

class BalanceProviders with ChangeNotifier {
  BalanceModels data = BalanceModels();

  bool loading = false;
  ServicesBalance services = ServicesBalance();

  Future<void> getPostData(context, String token) async {
    loading = true;

    data = await services.getData(context, token);

    loading = false;

    notifyListeners();
  }
}
