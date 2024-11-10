import 'package:flutter/material.dart';


class Resposta extends StatelessWidget {
  final String text;
  final void Function() quandoSelecionado;

  // Construtor
  Resposta(this.text, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: quandoSelecionado,
    );
  }
}
