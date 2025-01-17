import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() _quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this._quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Gênio!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: _quandoReiniciarQuestionario,
          child: const Text(
            "Reiniciar?",
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        )
      ],
    );
  }
}
