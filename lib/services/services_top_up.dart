import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/models/topUp_models.dart';

class ServicesTopUp {
  var bearerTokenLogin;
  int statusTopup = 0;
  Future<TopupModels> postData(context, String topUp, String token) async {
    TopupModels data = TopupModels(topUpAmount: topUp );

    try {
      final response = await http.post(
        Uri.parse('https://take-home-test-api.nutech-integrasi.com/topup'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'top_up_amount': topUp,
          
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        if (item['status'] == 0) {
          statusTopup = 1;
          String message = item['message'];
      

          print("Login berhasil: $message");
          print("Token: $token");

          data = TopupModels.fromJson(item['data']);
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
