import 'package:elanel_asistencia_it/domain/entities/feedback.dart';

abstract class IFeedbacksRepository {
  Future<void> sendFeedback(TicketFeedback feedback);
  Future<List<TicketFeedback>> getFeedbacks();
  Future<void> deleteFeedback(String id);
  Future<void> updateFeedback(TicketFeedback feedback);
}