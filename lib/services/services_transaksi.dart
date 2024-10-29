import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:sims_ppob_drajatdanuwardana/models/transaksi_models.dart';

class ServicesTransaksi {

  Future<TransaksiModels> getData(context, String token, int limit) async {
   late TransaksiModels  data = TransaksiModels();

    try {
      final response = await http.get(
        Uri.parse(
            'https://take-home-test-api.nutech-integrasi.com/transaction/history?offset=0&limit=$limit'),
        headers: {
          'Authorization': 'Bearer $token',
        
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body); 
        data = TransaksiModels.fromJson(item);
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred'+e.toString());
    }
    return data;
  }
}