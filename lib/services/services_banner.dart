import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/models/banner_models.dart';



class ServicesBanner {
  Future<BannerModels> getData(context, String token) async {
    BannerModels data = BannerModels();

    try {
      final response = await http.get(
        Uri.parse('https://take-home-test-api.nutech-integrasi.com/banner'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        final test = BannerModels();

        if (item['status'] == 0) {
          String message = item['message'];
          var dataa = item['data'];
print("Test BANNER: ${test.message}");
          print("Lamu: $message");
          print("Damu: $dataa");

          data = BannerModels.fromJson(item);
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
