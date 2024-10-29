import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';

import 'package:sims_ppob_drajatdanuwardana/models/pembayaran_models.dart';

class ServicesPembayaran {
  var bearerTokenLogin;
  int statusPembayaran = 0;
  Future<PembayaranModels> postData(
      context, String serviceCode, String token) async {
    PembayaranModels data = PembayaranModels(
      serviceCode: serviceCode,
    );

    try {
      final response = await http.post(
        Uri.parse(
            'https://take-home-test-api.nutech-integrasi.com/transaction'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'service_code': serviceCode,
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        if (item['status'] == 0) {
          statusPembayaran = 1;
          String message = item['message'];
          String token = item['data']['token'];
          bearerTokenLogin = item['data']['token'];

          print("Login berhasil: $message");
          print("Token: $token");

          data = PembayaranModels.fromJson(item['data']);
        } else {
          toastValidate("${item['message']}");

          print("Login gagal: ${item['message']}");
        }
      } else {
        final item = json.decode(response.body);
        toastValidate("${item['message']}");
        print('Error Occurred: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error Occurred: ${e.toString()}');
    }

    return data;
  }
}
