import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceFromFirebase {
  final String id;
  final String name;
  final String type;
  final int ticketCount;
  final DateTime lastMaintenance;

  DeviceFromFirebase({
    required this.id,
    required this.name,
    required this.type,
    required this.ticketCount,
    required this.lastMaintenance,
  });

  factory DeviceFromFirebase.fromJson(String id, Map<String, dynamic> json) {
    return DeviceFromFirebase(
      id: id,
      name: json['name'] ?? '',
      type: json['type'] ?? 'unknown',
      ticketCount: json['ticketCount'] ?? 0,
      lastMaintenance: (json['lastMaintenance'] != null)
          ? (json['lastMaintenance'] as Timestamp).toDate()
          : DateTime.now(), // asigna fecha actual por default
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type,
    'ticketCount': ticketCount,
    'lastMaintenance': Timestamp.fromDate(lastMaintenance),
  };
}
