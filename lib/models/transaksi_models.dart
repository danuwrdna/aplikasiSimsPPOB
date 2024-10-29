import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';

class TransaksiModels {
  int? statusCode;
  String? message;
  GetData? data;

  TransaksiModels({
    this.statusCode,
    this.message,
    this.data,
  });

  TransaksiModels.fromJson(Map<String, dynamic> json) {
    statusCode = json["status"]; 
    message = json["message"];    
    data = json["data"] != null ? GetData.fromJson(json["data"]) : toastValidate("eror awal"); // Pastikan JSON valid
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
  String? offset; 
  String? limit; 
  List<RecordsData>? records;

  GetData({this.offset, this.limit, this.records});

  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      offset: json["offset"], // Harusnya "offset" sesuai dengan JSON
      limit: json["limit"],   // Harusnya "limit" sesuai dengan JSON
      records: json["records"] != null
          ? List<RecordsData>.from(
              json["records"].map((x) => RecordsData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["offset"] = offset;
    jsonData["limit"] = limit;
    jsonData["records"] = records != null
        ? List<dynamic>.from(records!.map((x) => x.toJson()))
        : [];
    return jsonData;
  }
}

class RecordsData {
  String? invoiceNumber;
  String? transactionType;
  String? description;
  int? totalAmount;
  String? createdOn;

  RecordsData({
    this.invoiceNumber,
    this.transactionType,
    this.description,
    this.totalAmount,
    this.createdOn,
  });

  RecordsData.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json["invoice_number"]; // Harusnya "invoice_number" sesuai dengan JSON
    transactionType = json["transaction_type"]; // Harusnya "transaction_type" sesuai dengan JSON
    description = json["description"]; // Harusnya "description" sesuai dengan JSON
    totalAmount = json["total_amount"]; // Harusnya "total_amount" sesuai dengan JSON
    createdOn = json["created_on"]; // Harusnya "created_on" sesuai dengan JSON
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["invoice_number"] = invoiceNumber;
    data["transaction_type"] = transactionType;
    data["description"] = description;
    data["total_amount"] = totalAmount;
    data["created_on"] = createdOn;
    return data;
  }
}
