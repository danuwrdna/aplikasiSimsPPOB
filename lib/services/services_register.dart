import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';

import 'package:sims_ppob_drajatdanuwardana/models/register_models.dart';

class ServicesRegister {
  int registerProses = 0;
  Future<RegisterModels> postData(context, String email, String firstName,
      String lastName, String password,) async {
    RegisterModels data = RegisterModels(
        email: email,
        fistName: firstName,
        lastName: lastName,
        password: password);

    try {
 
      final response = await http.post(
        Uri.parse(
            'https://take-home-test-api.nutech-integrasi.com/registration'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
      
        final item = json.decode(response.body);

        if (item['status'] == 0) {
          registerProses = 1;
          print(registerProses);
          String message = item['message'];

          print("daftar berhasil: $message");


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
