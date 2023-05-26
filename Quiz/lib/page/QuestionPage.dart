import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Qual bicho transmite Doença de Chagas?',
      'options': {
        'a': 'Aedes aegypti',
        'b': 'Barbeiro',
        'c': 'Pulga',
        'd': 'Caramujo',
        'e': 'Muriçoca',
      },
      'correctAnswer': 'b',
      'selectedAnswer': null,
      'isCorrect': null,
    },
    {
      'question': 'Qual fruto é conhecido no Norte e Nordeste como "jerimum"?',
      'options': {
        'a': 'Abacate',
        'b': 'Caju',
        'c': 'Dendê',
        'd': 'Melancia',
        'e': 'Abóbora',
      },
      'correctAnswer': 'e',
      'selectedAnswer': null,
      'isCorrect': null,
    },
    {
      'question': 'Qual é o coletivo de cães?',
      'options': {
        'a': 'Cardume',
        'b': 'Rebanho',
        'c': 'Alcateia',
        'd': 'Manada',
        'e': 'Matilha',
      },
      'correctAnswer': 'e',
      'selectedAnswer': null,
      'isCorrect': null,
    },
    {
      'question': 'Qual é o triângulo que tem todos os lados diferentes?',
      'options': {
        'a': 'Equilátero',
        'b': 'Isósceles',
        'c': 'Escaleno',
        'd': 'Retângulo',
        'e': 'Obtusângulo',
      },
      'correctAnswer': 'c',
      'selectedAnswer': null,
      'isCorrect': null,
    },
    {
      'question': 'Quem compôs o Hino da Independência?',
      'options': {
        'a': 'Castro Alves',
        'b': 'Machado de Assis',
        'c': 'Carlos Gomes',
        'd': 'Manuel Bandeira',
        'e': 'Dom Pedro I',
      },
      'correctAnswer': 'c',
      'selectedAnswer': null,
      'isCorrect': null,
    },
  ];

  bool allQuestionsAnswered() {
    for (var question in questions) {
      if (question['selectedAnswer'] == null) {
        return false;
      }
    }
    return true;
  }

  void checkAnswers() {
    for (var question in questions) {
      if (question['selectedAnswer'] == question['correctAnswer']) {
        question['isCorrect'] = true;
      } else {
        question['isCorrect'] = false;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return Card(
                  color: question['isCorrect'] != false ? null:  Colors.red ,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question['question'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        for (var option in question['options'].entries)
                          RadioListTile(
                            title: Text(option.value),
                            value: option.key,
                            groupValue: question['selectedAnswer'],
                            onChanged: (value) {
                              setState(() {
                                question['selectedAnswer'] = value;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: allQuestionsAnswered() ? checkAnswers : null,
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

