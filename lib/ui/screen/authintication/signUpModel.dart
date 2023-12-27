class SignUpModel {
  String userId;
  String username;
  String email;
  String phoneNumber;
  String password;

  SignUpModel({
    required this.password,
    required this.userId,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  // Create a factory constructor to convert Firebase snapshot to User object
  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'], // Corrected property name
    );
  }

  // Convert User object to a Map for Firebase storage
  toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}
