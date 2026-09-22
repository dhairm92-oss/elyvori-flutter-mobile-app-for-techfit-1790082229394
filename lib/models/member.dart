class Member {
  final String id;
  final String name;
  final String email;
  final String membershipType;
  final String avatarUrl;
  final DateTime expiryDate;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.membershipType,
    required this.avatarUrl,
    required this.expiryDate,
  });

  bool get isActive => expiryDate.isAfter(DateTime.now());
}
