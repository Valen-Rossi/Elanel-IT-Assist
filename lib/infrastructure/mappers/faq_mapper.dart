import 'package:elanel_asistencia_it/domain/entities/faq.dart';
import 'package:elanel_asistencia_it/infrastructure/models/firebase/faq_firebase.dart';

class FAQMapper {

  static FAQ toEntity(FAQFromfirebase fb) {
    return FAQ(
      id: fb.id,
      title: fb.title,
      description: fb.description,
      type: FAQTypeX.fromString(fb.type),
    );
  }

  static FAQFromfirebase toFirebase(FAQ f) {
    return FAQFromfirebase(
      id: f.id,
      title: f.title,
      description: f.description,
      type: f.type.name,
    );
  }
}