import 'package:flutter/material.dart';
enum UserRole { admin, client, technician }

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final UserRole role; 

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}
// ===== UserRole Extensions =====
extension UserRoleLabel on UserRole {
  String get label {
    switch (this) {
      case UserRole.admin:
        return 'Administrador';
      case UserRole.client:
        return 'Cliente';
      case UserRole.technician:
        return 'Técnico';
    }
  }
}

extension UserRoleColor on UserRole {
  Color get color {
    switch (this) {
      case UserRole.admin:
        return Colors.deepPurple.shade200;
      case UserRole.client:
        return Colors.blue.shade200;
      case UserRole.technician:
        return Colors.green.shade200;
    }
  }
}

extension UserRoleIcon on UserRole {
  IconData get icon {
    switch (this) {
      case UserRole.admin:
        return Icons.admin_panel_settings;
      case UserRole.client:
        return Icons.person;
      case UserRole.technician:
        return Icons.build;
    }
  }
}