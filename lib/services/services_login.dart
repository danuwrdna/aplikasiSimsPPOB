import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/models/login_models.dart';

class ServicesLogin {
  var bearerTokenLogin;
  int statusLogin = 0;
  Future<LoginModels> postData(context, String email, String password) async {
    LoginModels data = LoginModels(email: email, password: password);

    try {
      final response = await http.post(
        Uri.parse('https://take-home-test-api.nutech-integrasi.com/login'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        if (item['status'] == 0) {
          statusLogin = 1;
          String message = item['message'];
          String token = item['data']['token'];
          bearerTokenLogin = item['data']['token'];

          print("Login berhasil: $message");
          print("Token: $token");

          data = LoginModels.fromJson(item['data']);
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
