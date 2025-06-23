import 'package:flutter/material.dart';

enum TicketStatus { newTicket, inProgress, resolved }
enum TicketPriority { low, medium, high }
enum TicketCategory {
  hardware,
  software,
  account,         // Problemas de inicio de sesión, permisos, cuentas bloqueadas
  network,
  other,          // Casos especiales
}


class Ticket {
  final String id;
  final String title;
  final String description;
  final TicketStatus status;
  final TicketPriority priority;
  final TicketCategory category;
  final String otherCaregory;
  final String createdById;
  final String createdByEmail;
  final String createdByName;
  final String deviceId;
  final String technicianId;
  final List<String> mediaUrls;
  final DateTime createdAt;
  final DateTime assignedAt;
  final DateTime openedAt;
  final DateTime closedAt;
  final bool hasFeedback;

  Ticket({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.otherCaregory,
    required this.createdById,
    required this.createdByEmail,
    required this.createdByName,
    required this.deviceId,
    required this.technicianId,
    required this.mediaUrls,
    required this.createdAt,
    required this.assignedAt,
    required this.openedAt,
    required this.closedAt,
    required this.hasFeedback,
  });

}

extension TicketCopy on Ticket {
  Ticket copyWith({
    String? id,
    String? technicianId,
    TicketPriority? priority,
    TicketStatus? status,
    DateTime? assignedAt,
    DateTime? openedAt,
    DateTime? closedAt,
    bool? hasFeedback,
    // otros campos si querés
  }) {
    return Ticket(
      id: id ?? this.id,
      title: title,
      description: description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      category: category,
      otherCaregory: otherCaregory,
      createdById: createdById,
      createdByEmail: createdByEmail,
      createdByName: createdByName,
      deviceId: deviceId,
      technicianId: technicianId ?? this.technicianId,
      mediaUrls: mediaUrls,
      createdAt: createdAt,
      assignedAt: assignedAt ?? this.assignedAt,
      openedAt: openedAt ?? this.openedAt,
      closedAt: closedAt ?? this.closedAt,
      hasFeedback: hasFeedback ?? this.hasFeedback,
    );
  }

}

extension TicketStatusX on TicketStatus {
  static TicketStatus fromString(String status) {
    switch (status) {
      case 'newTicket':
        return TicketStatus.newTicket;
      case 'inProgress':
        return TicketStatus.inProgress;
      case 'resolved':
        return TicketStatus.resolved;
      default:
        throw ArgumentError('Unknown ticket status: $status');
    }
  }
}

extension TicketPriorityX on TicketPriority {
  static TicketPriority fromString(String priority) {
    switch (priority) {
      case 'low':
        return TicketPriority.low;
      case 'medium':
        return TicketPriority.medium;
      case 'high':
        return TicketPriority.high;
      default:
        return TicketPriority.low;
    }
  }
}

extension TicketCategoryX on TicketCategory {
  static TicketCategory fromString(String category) {
    switch (category) {
      case 'hardware':
        return TicketCategory.hardware;
      case 'software':
        return TicketCategory.software;
      case 'account':
        return TicketCategory.account;
      case 'network':
        return TicketCategory.network;
      case 'other':
        return TicketCategory.other;
      default:
        throw ArgumentError('Unknown ticket category: $category');
    }
  }
}

extension TicketStatusText on TicketStatus {
  String get label {
    switch (this) {
      case TicketStatus.newTicket:
        return 'Nuevo';
      case TicketStatus.inProgress:
        return 'En curso';
      case TicketStatus.resolved:
        return 'Resuelto';
    }
  }
}

extension TicketPriorityText on TicketPriority {
  String get label {
    switch (this) {
      case TicketPriority.low:
        return 'Baja';
      case TicketPriority.medium:
        return 'Media';
      case TicketPriority.high:
        return 'Alta';
    }
  }
}

extension TicketCategoryText on TicketCategory {
  String get label {
    switch (this) {
      case TicketCategory.hardware:
        return 'Hardware';
      case TicketCategory.software:
        return 'Software';
      case TicketCategory.account:
        return 'Cuenta';
      case TicketCategory.network:
        return 'Red';
      case TicketCategory.other:
        return 'Otro';
    }
  }
}

extension TicketStatusColor on TicketStatus {
  Color get color {
    switch (this) {
      case TicketStatus.newTicket:
        return const Color.fromARGB(37, 36, 196, 218);
      case TicketStatus.inProgress:
        return const Color.fromARGB(37, 231, 151, 60);
      case TicketStatus.resolved:
        return const Color.fromARGB(37, 73, 217, 109);
    }
  }
}

extension TicketCategoryColor on TicketCategory {
  Color get color {
    switch (this) {
      case TicketCategory.hardware:
        return const Color.fromARGB(36, 80, 255, 208);
      case TicketCategory.software:
        return const Color.fromRGBO(224, 113, 255, 0.141);
      case TicketCategory.account:
        return const Color.fromARGB(37, 36, 196, 218);
      case TicketCategory.network:
        return const Color.fromARGB(31, 98, 195, 255);
      case TicketCategory.other:
        return const Color.fromARGB(37, 189, 189, 189);
    }
  }
}

extension TicketPriorityColor on TicketPriority {
  Color get color {
    switch (this) {
      case TicketPriority.low:
        return const Color.fromARGB(37, 73, 217, 109);
      case TicketPriority.medium:
        return const Color.fromARGB(37, 231, 151, 60);
      case TicketPriority.high:
        return const Color.fromARGB(36, 255, 71, 71);
    }
  }
}