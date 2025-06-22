// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/tarefas_models.dart';
import 'package:lista_de_tarefas/widgets/tarefa_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey.shade300,
          selectedColor: Colors.blueGrey,
          labelStyle: const TextStyle(color: Colors.black87),
          secondaryLabelStyle: const TextStyle(color: Colors.white),
        ),
      ),

      // CHAMA A OS WIDGETS DE Tarefas
      home: const TarefasScreen(),
    );
  }
}

// CRIA A TELA PRINCIPAL
class TarefasScreen extends StatefulWidget {
  const TarefasScreen({super.key});

  @override
  _TarefasScreenState createState() => _TarefasScreenState();
}

// CONTROI A TELA PRINCIPAL E PREENCHE COM OS Tarefas
class _TarefasScreenState extends State<TarefasScreen> {
  bool _isLoading = true;
  List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    _tarefas = [
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
    _isLoading = false;
  }

  void _navegarParaCadastro() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => CadastroTarefascreen(onSave: _adicionarTarefa),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Tarefas')),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: _tarefas.length,
                    itemBuilder: (context, index) {
                      final tarefa = _tarefas[index];
                      return TarefaWidget(
                        tarefa: tarefa,
                        aoRemover: () {
                          setState(() => _tarefas.removeAt(index));
                        },
                        aoAlternarConclusao: () {
                          setState(() => tarefa.concluida = !tarefa.concluida);
                        },
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                  ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _navegarParaCadastro,

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 10, 159, 246),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),

        child: const Text(
          "Cadastrar Tarefas",
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
