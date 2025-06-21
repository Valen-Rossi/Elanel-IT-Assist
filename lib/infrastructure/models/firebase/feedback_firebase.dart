import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackFromFirebase {
  final String id; 
  final String ticketId;
  final num rating;
  final String comment;
  final Timestamp createdAt;

  FeedbackFromFirebase({
    required this.id, 
    required this.ticketId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory FeedbackFromFirebase.fromJson(String id, Map<String, dynamic> json) {
    return FeedbackFromFirebase(
      id: id,
      ticketId: json['ticketId']?? '',
      rating: json['rating'] as num? ?? 0.0,
      comment: json['comment'] ?? '',
      createdAt: json['createdAt'] as Timestamp? ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'ticketId': ticketId,
    'rating': rating,
    'comment': comment,
    'createdAt': createdAt,
  };
}