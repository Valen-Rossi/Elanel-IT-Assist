import 'package:flutter/material.dart';
enum DeviceType {
  desktopPC,
  keyboard,
  laptop,
  monitor,
  mouse,
  phone,
  printer,
  projector,
  router,
  scanner,
  speaker,
  tablet,
  ups,// uninterruptiblePowerSupply,
  other,
}

class Device {
  final String id;
  final String name;
  final DeviceType type;
  final int ticketCount;
  final DateTime lastMaintenance;

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.ticketCount,
    required this.lastMaintenance,
  });
}

extension DeviceCopy on Device {
  Device copyWith({
    String? id,
    String? name,
    DeviceType? type,
    int? ticketCount,
    DateTime? lastMaintenance,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      ticketCount: ticketCount ?? this.ticketCount,
      lastMaintenance: lastMaintenance ?? this.lastMaintenance,
    );
  }
}

extension DeviceTypeX on DeviceType {
  static DeviceType fromString(String type) {
    return DeviceType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => DeviceType.other,
    );
  }
}

// ===== DeviceType Extensions =====
extension DeviceTypeLabel on DeviceType {
  String get label {
    switch (this) {
      case DeviceType.desktopPC:
        return 'PC de escritorio';
      case DeviceType.keyboard:
        return 'Teclado';
      case DeviceType.laptop:
        return 'Laptop';
      case DeviceType.monitor:
        return 'Monitor';
      case DeviceType.mouse:
        return 'Mouse';
      case DeviceType.phone:
        return 'Teléfono';
      case DeviceType.printer:
        return 'Impresora';
      case DeviceType.projector:
        return 'Proyector';
      case DeviceType.router:
        return 'Router';
      case DeviceType.scanner:
        return 'Escáner';
      case DeviceType.speaker:
        return 'Parlante';
      case DeviceType.tablet:
        return 'Tablet';
      case DeviceType.ups:
        return 'UPS';
      case DeviceType.other:
        return 'Otro';
    }
  }
}

extension DeviceTypeIcon on DeviceType {
  IconData get icon {
    switch (this) {
      case DeviceType.laptop:
        return Icons.laptop_rounded;
      case DeviceType.phone:
        return Icons.smartphone_rounded;
      case DeviceType.scanner:
        return Icons.adf_scanner_rounded;
      case DeviceType.printer:
        return Icons.print_rounded;
      case DeviceType.monitor:
        return Icons.monitor;
      case DeviceType.desktopPC:
        return Icons.desktop_mac_rounded;
      case DeviceType.keyboard:
        return Icons.keyboard;
      case DeviceType.router:
        return Icons.router;
      case DeviceType.tablet:
        return Icons.tablet_mac_rounded;
      case DeviceType.projector:
        return Icons.fit_screen_rounded;
      case DeviceType.speaker:
        return Icons.speaker;
      case DeviceType.mouse:
        return Icons.mouse;
      case DeviceType.ups:
        return Icons.power;
      case DeviceType.other:
        return Icons.devices_other_outlined;
    }
  }
}

extension DeviceTypeColor on DeviceType {
  Color get color {
    switch (this) {
      case DeviceType.laptop:
        return Colors.blue.shade100;
      case DeviceType.phone:
        return Colors.green.shade100;
      case DeviceType.scanner:
        return Colors.deepPurple.shade100;
      case DeviceType.printer:
        return Colors.orange.shade100;
      case DeviceType.monitor:
        return Colors.teal.shade100;
      case DeviceType.desktopPC:
        return Colors.indigo.shade100;
      case DeviceType.keyboard:
        return Colors.lime.shade100;
      case DeviceType.router:
        return Colors.amber.shade100;
      case DeviceType.tablet:
        return Colors.pink.shade100;
      case DeviceType.projector:
        return Colors.cyan.shade100;
      case DeviceType.speaker:
        return Colors.red.shade100;
      case DeviceType.mouse:
        return Colors.brown.shade100;
      case DeviceType.ups:
        return Colors.grey.shade400;
      case DeviceType.other:
        return Colors.grey.shade200;
    }
  }
}
