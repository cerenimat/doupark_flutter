import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic>? userData;

  const HomeScreen({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    final username = userData?['username'] ?? 'Kullanıcı';
    final plate = userData?['plate'] ?? '-';

    return Scaffold(
      appBar: AppBar(
        title: const Text("DouPark"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.local_parking_rounded,
                    size: 60,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Hoş geldin, $username",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Plaka: $plate",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}