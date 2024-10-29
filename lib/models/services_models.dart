class ServicesModels {
  int? statusCode;
  String? message;
  List<GetData>? data;

  ServicesModels({
    this.statusCode,
    this.message,
    this.data,
  });

  ServicesModels.fromJson(Map<String, dynamic> json) {
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

class GetData {
  String? serviceCode;
  String? serviceName;
  String? serviceIcon;
  int? serviceTariff;

  GetData({
    this.serviceCode,
    this.serviceName,
    this.serviceIcon,
    this.serviceTariff,
  });

  GetData.fromJson(Map<String, dynamic> json) {
    serviceCode = json["service_code"];
    serviceName = json["service_name"];
    serviceIcon = json["service_icon"];
    serviceTariff = json["service_tariff"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["service_code"] = serviceCode;
    data["service_name"] = serviceName;
    data["service_icon"] = serviceIcon;
    data["service_tariff"] = serviceTariff;
    return data;
  }
}
