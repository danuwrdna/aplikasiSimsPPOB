class PembayaranModels {
  String? serviceCode;

  PembayaranModels({
    this.serviceCode,
  });
  factory PembayaranModels.fromJson(Map<String, dynamic> json) => PembayaranModels(
        serviceCode: json["service_code"],
      );
  Map<String, dynamic> toJson() => {
        "service_code": serviceCode,
      };
}
