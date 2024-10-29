class BannerModels {
  int? statusCode;
  String? message;
  List<GetData>? data;

  BannerModels({
    this.statusCode,
    this.message,
    this.data,
  });

  BannerModels.fromJson(Map<String, dynamic> json) {
    statusCode = json["status"];
    message = json["message"];
    data = json["data"] != null
        ? List<GetData>.from(json["data"].map((x) => GetData.fromJson(x)))
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["status"] = statusCode;
    jsonData["message"] = message;
    jsonData["data"] = data != null
        ? List<dynamic>.from(data!.map((x) => x.toJson()))
        : [];
    return jsonData;
  }
}
//  {
//             "banner_name": "Banner 1",
//             "banner_image": "https://minio.nutech-integrasi.com/take-home-test/banner/Banner-1.png",
//             "description": "Lerem Ipsum Dolor sit amet"
//         },
class GetData {
  String? bannerName;
  String? bannerImage;
  String? description;


  GetData({
    this.bannerName,
    this.bannerImage,
    this.description,
  
  });

  GetData.fromJson(Map<String, dynamic> json) {
    bannerName = json["banner_name"];
    bannerImage = json["banner_image"];
    description = json["description"];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["banner_name"] = bannerName;
    data["banner_image"] = bannerImage;
    data["description"] = description;
   
    return data;
  }
}
