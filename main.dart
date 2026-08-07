import 'package:flutter/material.dart'; // Importa os componentes do Flutter

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MediaEscolarPage(),
    );
  }
}

class MediaEscolarPage extends StatefulWidget {
  const MediaEscolarPage({super.key});

  @override
  State<MediaEscolarPage> createState() => _MediaEscolarPageState();
}

class _MediaEscolarPageState extends State<MediaEscolarPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();

  String nomeAluno = '';
  String situacao = '';
  double media = 0;

  

  void calcularMedia() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0;
    double nota3 = double.tryParse(nota3Controller.text) ?? 0;

    setState(() {
      nomeAluno = nomeController.text;
      media = (nota1 + nota2 + nota3) / 3;

      if (media >= 7) {
        situacao = 'Aprovado';
      } else if (media >= 5) {
        situacao = 'Recuperação';
      } else {
        situacao = 'Reprovado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de Média"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.school,
              size: 80,
            ),

            const SizedBox(height: 10),

            const Text(
              'Média Escolar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Digite o nome e as três notas do aluno',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            // Nome do aluno
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do aluno',
                hintText: 'Digite o nome do aluno',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            // Nota 1
            TextField(
              controller: nota1Controller,
              decoration: const InputDecoration(
                labelText: 'Nota 1',
                hintText: 'Digite uma nota de 0 a 10',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

            const SizedBox(height: 20),

            // Nota 2
            TextField(
              controller: nota2Controller,
              decoration: const InputDecoration(
                labelText: 'Nota 2',
                hintText: 'Digite uma nota de 0 a 10',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

            const SizedBox(height: 20),

            // Nota 3
            TextField(
              controller: nota3Controller,
              decoration: const InputDecoration(
                labelText: 'Nota 3',
                hintText: 'Digite uma nota de 0 a 10',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

            const SizedBox(height: 25),

            // Botão
            ElevatedButton.icon(
              onPressed: calcularMedia,
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular Média'),
            ),

            const SizedBox(height: 25),

            // Resultado
            if (situacao.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Aluno: $nomeAluno',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Média: ${media.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Situação: $situacao',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }
}