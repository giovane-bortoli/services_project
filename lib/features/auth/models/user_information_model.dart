class UserInformationModel {
  final String email;
  final String password;
  UserInformationModel({
    required this.email,
    required this.password,
  });

  factory UserInformationModel.fromJson(Map<String, dynamic> json) {
    return UserInformationModel(
        email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
