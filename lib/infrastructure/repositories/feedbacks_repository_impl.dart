import 'package:elanel_asistencia_it/domain/datasources/feedbacks_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/feedback.dart';
import 'package:elanel_asistencia_it/domain/repositories/feedbacks_repository.dart';

class FeedbacksRepositoryImpl extends IFeedbacksRepository {
  final IFeedbacksDatasource datasource;

  FeedbacksRepositoryImpl(this.datasource);

  @override
  Future<void> sendFeedback(TicketFeedback feedback) async {
    await datasource.sendFeedback(feedback);
  }

  @override
  Future<List<TicketFeedback>> getFeedbacks() async {
    return datasource.getFeedbacks();
  }

  @override
  Future<void> deleteFeedback(String id) {
    // TODO: implement deleteFeedback
    throw UnimplementedError();
  }

  @override
  Future<void> updateFeedback(TicketFeedback feedback) {
    // TODO: implement updateFeedback
    throw UnimplementedError();
  }
}