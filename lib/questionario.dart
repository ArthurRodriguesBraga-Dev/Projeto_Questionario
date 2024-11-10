import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaselecionada;
  final void Function(int) quandoResponder;

  Questionario(
      {required this.perguntas,
      required this.perguntaselecionada,
      required this.quandoResponder});

  bool get temPerguntaSelecionada {
    return perguntaselecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaselecionada].cast()["respostas"]
            as List<Map<String, Object>>
        : [];

    List<Widget> widgets = respostas
        .map((resp) => Resposta(resp["texto"] as String,
            () => quandoResponder(int.parse(resp["pontuacao"].toString()))))
        .toList();
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaselecionada]["texto"].toString()),
        ...widgets,
      ],
    );
  }
}
