import 'package:elanel_asistencia_it/domain/entities/feedback.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:elanel_asistencia_it/presentation/providers/feedback/feedbacks_provider.dart';

final feedbackByIdProvider = Provider.family<TicketFeedback, String>((ref, ticketFeedbackId) {
  final feedbacks = ref.watch(feedbacksProvider);
  return feedbacks.firstWhere((feedback) => feedback.ticketId == ticketFeedbackId);
});