import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  UserModel({
    required this.email,
    required this.name,
  });

  UserModel copyWith({
    String? email,
    String? name,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.email == email && other.name == name;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode;
}
