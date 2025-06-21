import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elanel_asistencia_it/domain/entities/feedback.dart';
import 'package:elanel_asistencia_it/infrastructure/models/firebase/feedback_firebase.dart';

class FeedbackMapper {

  static TicketFeedback fromFirebase(FeedbackFromFirebase fb) => TicketFeedback(
    id: fb.id,
    ticketId: fb.ticketId,
    rating: fb.rating.toDouble(),
    comment: fb.comment,
    createdAt: fb.createdAt.toDate(),
  );

  static FeedbackFromFirebase toFirebase(TicketFeedback feedback) => FeedbackFromFirebase(
    id: feedback.id,
    ticketId: feedback.ticketId,
    rating: feedback.rating,
    comment: feedback.comment,
    createdAt: Timestamp.fromDate(feedback.createdAt),
  );
  
}