class TopupModels {
  String? topUpAmount;

  TopupModels({
    this.topUpAmount,
  });
  factory TopupModels.fromJson(Map<String, dynamic> json) => TopupModels(
        topUpAmount: json["top_up_amount"],
      );
  Map<String, dynamic> toJson() => {
        "top_up_amount": topUpAmount,
      };
}
