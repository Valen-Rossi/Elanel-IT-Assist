import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elanel_asistencia_it/domain/datasources/feedbacks_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/feedback.dart';
import 'package:elanel_asistencia_it/infrastructure/mappers/feedback_mapper.dart';
import 'package:elanel_asistencia_it/infrastructure/models/firebase/feedback_firebase.dart';

class FeedbacksFbDatasource extends IFeedbacksDatasource {

  final _db = FirebaseFirestore.instance.collection('feedback');

  @override
  Future<List<TicketFeedback>> getFeedbacks() async {
    final snap = await _db.orderBy('createdAt', descending: true).get();
    return snap.docs
        .map((d) => FeedbackMapper.fromFirebase(
            FeedbackFromFirebase.fromJson(d.id, d.data())))
        .toList();
  }

  @override
  Future<void> sendFeedback(TicketFeedback feedback) async {
    final docRef = _db.doc(); // genera un nuevo id
    final newFeedback = feedback.copyWith(id: docRef.id); // copiás el feedback con ese id

    final feedbackFb = FeedbackMapper.toFirebase(newFeedback);
    await docRef.set(feedbackFb.toJson());
  }

  @override
  Future<void> updateFeedback(TicketFeedback feedback) async {
    final fb = FeedbackMapper.toFirebase(feedback);
    await _db.doc(feedback.ticketId).update(fb.toJson());
  }

  @override
  Future<void> deleteFeedback(String id) async {
    await _db.doc(id).delete();
  }
}