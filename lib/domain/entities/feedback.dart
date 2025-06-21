class TicketFeedback {
  final String id;
  final String ticketId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  TicketFeedback({
    required this.id,
    required this.ticketId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}
 extension TicketFeedbackCopy on TicketFeedback {
  TicketFeedback copyWith({
    String? id,
    String? ticketId,
    double? rating,
    String? comment,
    DateTime? createdAt,
  }) {
    return TicketFeedback(
      id: id ?? this.id,
      ticketId: ticketId ?? this.ticketId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
 }