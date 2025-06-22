
import 'package:elanel_asistencia_it/domain/entities/faq.dart';

class FAQFromfirebase {
  final String id;
  final String title;
  final String description;
  final String type;

  FAQFromfirebase({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
  });

  factory FAQFromfirebase.fromJson(String id, Map<String, dynamic> json) {
    return FAQFromfirebase(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? FAQType.other.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
    };
  }
  
}