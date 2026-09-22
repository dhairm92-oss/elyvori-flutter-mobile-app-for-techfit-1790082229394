class CheckIn {
  final String id;
  final String memberId;
  final String memberName;
  final DateTime timestamp;
  final String location;

  CheckIn({
    required this.id,
    required this.memberId,
    required this.memberName,
    required this.timestamp,
    required this.location,
  });
}
