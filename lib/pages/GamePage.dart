import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var numberToGuess = Random().nextInt(100) + 1;
  var _tries = 10;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showSnackBar(
      String title,
      String message,
      ContentType contentType,
    ) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Devine le nombre"),
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Devine le nombre",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: myController,
                    decoration:
                        const InputDecoration(labelText: "Entrez un nombre"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      final guessNumber = int.tryParse(myController.text);
                      if (guessNumber == null) {
                        showSnackBar(
                          'Erreur',
                          'Veuillez entrer un nombre',
                          ContentType.warning,
                        );
                        return;
                      }
                      if (guessNumber < 1 || guessNumber > 100) {
                        showSnackBar(
                          'Erreur',
                          'Le nombre doit être compris entre 1 et 100',
                          ContentType.warning,
                        );
                        return;
                      }
                      if (guessNumber == numberToGuess) {
                        context.go('/victory');
                        return;
                      }
                      showSnackBar(
                        'Loupé !',
                        guessNumber > numberToGuess
                            ? 'Le nombre est plus petit'
                            : 'Le nombre est plus grand',
                        ContentType.failure,
                      );
                      if (_tries == 1) {
                        context.go('/defeat');
                      }
                      setState(() {
                        --_tries;
                      });
                    },
                    child: const Text("Valider")),
                const SizedBox(height: 16),
                Text("Tentatives : $_tries"),
              ]),
        ));
  }
}
