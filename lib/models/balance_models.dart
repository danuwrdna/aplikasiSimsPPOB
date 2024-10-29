class BalanceModels {
  int? statusCode;
  String? message;
  GetData? data;

  BalanceModels({
    this.statusCode,
    this.message,
    this.data,
  });
  BalanceModels.fromJson(Map<String, dynamic> json) {
    statusCode = json["status"];
    message = json["message"];
    data = json["data"] != null ? GetData.fromJson(json["data"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = statusCode;
    data["message"] = message;
    data["data"] = this.data?.toJson();
    return data;
  }
}

class GetData {
  int? balance;

  GetData({
    this.balance,
  });
  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      balance: json["balance"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["balance"] = balance;

    return data;
  }
}
