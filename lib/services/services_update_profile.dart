import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';

import 'package:sims_ppob_drajatdanuwardana/models/update_profiles_models.dart';

class ServicesUpdateProfile {
  var bearerTokenLogin;
  int statusTopup = 0;
  Future<UpdateProfilesModels> postData(
      context, String firstName, String lastName, String token) async {
    UpdateProfilesModels data =
        UpdateProfilesModels(firstName: firstName, lastName: lastName);

    try {
      final response = await http.put(
        Uri.parse(
            'https://take-home-test-api.nutech-integrasi.com/profile/update'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        if (item['status'] == 0) {
          statusTopup = 1;
          String message = item['message'];

          print("Login berhasil: $message");
          print("Token: $token");

          data = UpdateProfilesModels.fromJson(item['data']);
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
