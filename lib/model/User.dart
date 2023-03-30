class User {
  final String? username;
  final String? email;
  final String password;

  User({this.username, this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}