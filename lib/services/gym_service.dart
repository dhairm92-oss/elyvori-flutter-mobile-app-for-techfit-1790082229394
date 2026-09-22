import 'package:flutter/foundation.dart';
import '../models/member.dart';
import '../models/check_in.dart';

class GymService extends ChangeNotifier {
  Member _currentMember = Member(
    id: 'TF-94821',
    name: 'Alex Johnson',
    email: 'alex.johnson@techfit.io',
    membershipType: 'VIP All-Access',
    avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
    expiryDate: DateTime.now().add(const Duration(days: 180)),
  );

  final List<CheckIn> _history = [
    CheckIn(
      id: 'c1',
      memberId: 'TF-94821',
      memberName: 'Alex Johnson',
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      location: 'Downtown Main Branch',
    ),
    CheckIn(
      id: 'c2',
      memberId: 'TF-94821',
      memberName: 'Alex Johnson',
      timestamp: DateTime.now().subtract(const Duration(days: 3, hours: 2)),
      location: 'Downtown Main Branch',
    ),
  ];

  Member get currentMember => _currentMember;
  List<CheckIn> get history => List.unmodifiable(_history);

  void updateMember(Member updated) {
    _currentMember = updated;
    notifyListeners();
  }

  bool checkIn({required String location}) {
    if (!_currentMember.isActive) return false;
    
    final newCheckIn = CheckIn(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      memberId: _currentMember.id,
      memberName: _currentMember.name,
      timestamp: DateTime.now(),
      location: location,
    );
    
    _history.insert(0, newCheckIn);
    notifyListeners();
    return true;
  }
}
