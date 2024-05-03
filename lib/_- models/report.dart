class Report {
  final String id;
  final String userId;
  final String clientId;
  final String description;
  final DateTime startTime;
  final Duration duration;
  bool sent;
  int? rating;

  Report({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.description,
    required this.startTime,
    required this.duration,
    this.sent = false,
    this.rating,
  });
}
