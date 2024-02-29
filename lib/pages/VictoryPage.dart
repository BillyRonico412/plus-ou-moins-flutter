import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VictoryPage extends StatelessWidget {
  const VictoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Victoire"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text("Vous avez trouvé le bon nombre"),
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
