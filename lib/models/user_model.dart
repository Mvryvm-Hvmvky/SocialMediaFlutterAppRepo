class UserModel {
  final int id;
  final String name;
  final String email;
  final String icon;
  String bio;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.icon,
    required this.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["userName"],
      email: json["email"],
      icon: json["icon"],
      bio: json["bio"],
    );
  }
}
