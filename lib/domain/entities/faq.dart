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
        return Colors.lightBlue.shade400;
      case FAQType.software:
        return Colors.deepOrange.shade400;
      case FAQType.account:
        return Colors.lightGreen.shade400;
      case FAQType.network:
        return Colors.blueGrey.shade400;
      case FAQType.other:
        return Colors.grey.shade400;
    }
  }
}