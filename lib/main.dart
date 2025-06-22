import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/tarefas_models.dart';
import 'package:lista_de_tarefas/screens/tarefas_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 19, 204, 208),
        ),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Lista de tarefas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tarefa> _tarefas = [
    Tarefa(
      titulo: "Estudar Flutter",
      descricao: "Avançar no módulo de widgets",
    ),
    Tarefa(titulo: "Comprar pão", descricao: "Integral, se tiver"),
    Tarefa(titulo: "Comprar pão", descricao: "Integral, se tiver"),
    Tarefa(titulo: "Comprar pão", descricao: "Integral, se tiver"),
    Tarefa(titulo: "Comprar pão", descricao: "Integral, se tiver"),
    Tarefa(titulo: "Comprar pão", descricao: "Integral, se tiver"),
  ];

  void _navegarParaTarefas() async {
    final resultado = await Navigator.of(context).push<List<Tarefa>>(
      MaterialPageRoute(builder: (context) => TarefasScreen(tarefas: _tarefas)),
    );

    if (resultado != null) {
      setState(() {
        _tarefas = resultado;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: _navegarParaTarefas,
          child: Text("Ir para Tarefas"),
        ),
      ),
    );
  }
}
