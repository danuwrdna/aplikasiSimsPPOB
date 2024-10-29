class LoginModels{
  String? email;
  String? password;

  LoginModels({
 this.email,
 this.password
  });
  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
    email: json["email"],
    password: json["password"],
    );
    Map<String, dynamic> toJson() => {
      "email": email,
      "password":password,
    };
} 
