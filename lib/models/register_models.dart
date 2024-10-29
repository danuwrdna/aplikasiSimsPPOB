class RegisterModels{
  String? email;
    String? fistName;
    String? lastName;
  String? password;

  RegisterModels({
 this.email,
 this.fistName,
 this.lastName,
 this.password
  });
  factory RegisterModels.fromJson(Map<String, dynamic> json) => RegisterModels(
    email: json["email"],
       fistName: json["first_name"],
       lastName: json["last_name"],
    password: json["password"],
    );
    Map<String, dynamic> toJson() => {
      "email": email,
      "first_name": fistName,
      "last_name": lastName,
      "password":password,
    };
} 
