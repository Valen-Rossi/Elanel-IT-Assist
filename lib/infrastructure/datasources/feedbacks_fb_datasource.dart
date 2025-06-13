import 'package:elanel_asistencia_it/domain/datasources/feedbacks_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/feedback.dart';

class FeedbacksFbDatasource extends IFeedbacksDatasource {

  final List<TicketFeedback> feedbacks = [
    TicketFeedback(
      ticketId: '006',
      rating: 4.5,
      comment: 'Buen servicio, pero podría mejorar la comunicación.',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  @override
  Future<void> deleteFeedback(String id) {
    // TODO: implement deleteFeedback
    throw UnimplementedError();
  }

  @override
  Future<List<TicketFeedback>> getFeedbacks() async{
    // TODO: implement getFeedbacks
    return feedbacks;
  }

  @override
  Future<void> sendFeedback(TicketFeedback feedback) async{
    // TODO: implement sendFeedback
    feedbacks.insert(0, feedback);
  }

  @override
  Future<void> updateFeedback(TicketFeedback feedback) {
    // TODO: implement updateFeedback
    throw UnimplementedError();
  }

  
}