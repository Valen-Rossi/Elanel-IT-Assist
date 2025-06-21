import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elanel_asistencia_it/presentation/providers/feedback/feedbacks_repository_provider.dart';

import 'package:elanel_asistencia_it/domain/entities/feedback.dart';

final feedbacksProvider = StateNotifierProvider<FeedbacksNotifier, List<TicketFeedback>>((ref) {
  
  final repository = ref.watch(feedbacksRepositoryProvider);
  
  return FeedbacksNotifier(
    fetchFeedbacks: repository.getFeedbacks,
    sendFeedback: repository.sendFeedback,
  );
});
typedef FeedbacksCallback = Future<List<TicketFeedback>> Function();
typedef SendFeedbackCallback = Future<void> Function(TicketFeedback feedback);

class FeedbacksNotifier extends StateNotifier<List<TicketFeedback>> {
  bool isLoading = false;
  final FeedbacksCallback fetchFeedbacks;
  final SendFeedbackCallback sendFeedback;

  FeedbacksNotifier({
    required this.fetchFeedbacks,
    required this.sendFeedback,
  }) : super([]);

  Future<void> loadFeedbacks() async {
    if (isLoading) return;

    isLoading = true;

    final List<TicketFeedback> feedbacks = await fetchFeedbacks();
    state.clear();
    state = [...feedbacks];

    isLoading = false;
  }

  Future<void> createFeedback(TicketFeedback feedback) async {
    if (isLoading) return;

    isLoading = true;

    await sendFeedback(feedback);
    state = [...state, feedback];

    isLoading = false;
  }
}