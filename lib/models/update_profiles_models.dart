class UpdateProfilesModels {
  String? firstName;
  String? lastName;

  UpdateProfilesModels({
    this.firstName,
    this.lastName,
  });
  UpdateProfilesModels.fromJson(Map<String, dynamic> json) {
    firstName = json["first_name"];
    lastName = json["last_name"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first_name"] = firstName;
    data["last_name"] = lastName;

    return data;
  }
}
// {
//   "first_name": "User Edited",
//   "last_name": "Nutech Edited"
// }

