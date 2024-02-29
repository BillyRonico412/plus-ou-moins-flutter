import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key? key, required this.message, required this.title})
      : super(key: key);

  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Recommencer"),
            ),
          ]),
    );
  }
}
