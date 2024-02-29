import 'package:flutter/material.dart';
import 'package:guess_number/pages/FinalPage.dart';

class DefeatPage extends StatelessWidget {
  const DefeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FinalPage(
        message: "Vous n'avez pas trouvé le bon nombre", title: "Défaite");
  }
}
