import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../services/gym_service.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gymService = Provider.of<GymService>(context);
    final history = gymService.history;

    return Scaffold(
      backgroundColor: const Color(0xFF121218),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2C),
        title: const Text('Check-In History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                'No check-in history found.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final checkIn = history[index];
                final formattedDate = DateFormat('MMM dd, yyyy - hh:mm a').format(checkIn.timestamp);
                
                return Card(
                  color: const Color(0xFF1E1E2C),
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00E676).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.fitness_center, color: Color(0xFF00E676)),
                    ),
                    title: Text(
                      checkIn.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        formattedDate,
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    trailing: const Icon(Icons.check_circle, color: Color(0xFF00E676), size: 20),
                  ),
                );
              },
            ),
    );
  }
}
