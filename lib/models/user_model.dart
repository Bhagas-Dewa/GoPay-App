// lib/models/user_model.dart
class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt; // Bisa jadi String atau null
  final String? createdAt;       // Bisa jadi String atau null
  final String? updatedAt;       // Bisa jadi String atau null

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  // Jika kamu perlu mengirim objek User sebagai JSON (misalnya update profile)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}