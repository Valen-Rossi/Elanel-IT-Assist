class UserFromFirebase {
  final String id;
  final String name;
  final String email;
  final String password;

  UserFromFirebase({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserFromFirebase.fromJson(Map<String, dynamic> json) {
    return UserFromFirebase(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
  
}