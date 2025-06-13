class TicketFeedback {
  final String ticketId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  TicketFeedback({
    required this.ticketId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}
