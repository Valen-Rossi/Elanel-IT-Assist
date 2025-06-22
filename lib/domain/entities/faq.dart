import 'package:flutter/material.dart';

enum FAQType {
  hardware,
  software,
  account,         // Problemas de inicio de sesión, permisos, cuentas bloqueadas
  network,
  other,          // Casos especiales
}

class FAQ {
  final String id;
  final String title;
  final String description;
  final FAQType type;

  FAQ({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
  });
}

extension FAQCopy on FAQ {
  FAQ copyWith({
    String? id,
    String? title,
    String? description,
    FAQType? type,
  }) {
    return FAQ(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }
}

extension FAQTypeX on FAQType {
  static FAQType fromString(String type) {
    switch (type) {
      case 'hardware':
        return FAQType.hardware;
      case 'software':
        return FAQType.software;
      case 'account':
        return FAQType.account;
      case 'network':
        return FAQType.network;
      case 'other':
        return FAQType.other;
      default:
        return FAQType.other;
    }
  }
}

// ===== FAQType Extensions =====
extension FAQTypeLabel on FAQType {
  String get label {
    switch (this) {
      case FAQType.hardware:
        return 'Hardware';
      case FAQType.software:
        return 'Software';
      case FAQType.account:
        return 'Cuenta';
      case FAQType.network:
        return 'Red';
      case FAQType.other:
        return 'Otro';
    }
  }
}
extension FAQTypeColor on FAQType {
  Color get color {
    switch (this) {
      case FAQType.hardware:
        return const Color.fromARGB(36, 80, 255, 208);
      case FAQType.software:
        return const Color.fromRGBO(224, 113, 255, 0.141);
      case FAQType.account:
        return const Color.fromARGB(37, 36, 196, 218);
      case FAQType.network:
        return const Color.fromARGB(31, 98, 195, 255);
      case FAQType.other:
        return const Color.fromARGB(37, 189, 189, 189);
    }
  }
}