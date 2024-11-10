import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaselecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      _perguntaselecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaselecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 7},
        {"texto": "Vermelho", "pontuacao": 10},
        {"texto": "Verde", "pontuacao": 4},
        {"texto": "Branco", "pontuacao": 1},
      ]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "pontuacao": 3},
        {"texto": "Cobra", "pontuacao": 2},
        {"texto": "Tubarão", "pontuacao": 10},
        {"texto": "Leão", "pontuacao": 8},
      ]
    },
    {
      "texto": "Qual é o seu professor favorito?",
      "respostas": [
        {"texto": "Yuri", "pontuacao": 5},
        {"texto": "Fabrine", "pontuacao": 10},
        {"texto": "Hugo", "pontuacao": 7},
        {"texto": "Danilo", "pontuacao": 2},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaselecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              centerTitle: true,
              title: const Text(
                "Perguntas",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaselecionada: _perguntaselecionada,
                    quandoResponder: _responder)
                : Resultado(_pontuacaoTotal,_reiniciarQuestionario)));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
