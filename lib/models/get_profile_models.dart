class GetProfileModels {
  int? statusCode;
  String? message;
  GetData? data;

  GetProfileModels({
    this.statusCode,
    this.message,
    this.data,
  });
  GetProfileModels.fromJson(Map<String, dynamic> json) {
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
 
  String? email;
  String? firstName;
  String? lastName;
 String? profileImages;

  GetData({
    this.email,
    this.firstName,
    this.lastName,
    this.profileImages,

  });
  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      profileImages: json["profile_image"],
      
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["profile_image"] = profileImages;
    return data;
  }
}
