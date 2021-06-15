class UserModel {
  String id;
  String email;
  String password;

  UserModel({this.id, this.email, this.password});

  UserModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }
}
