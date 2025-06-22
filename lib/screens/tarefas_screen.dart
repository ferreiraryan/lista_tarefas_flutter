// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {}

  Future<void> _adicionarTarefa(Map<String, dynamic> novoTarefa) async {}

  Future<void> _removerTarefa(Map<String, dynamic> TarefaRemover) async {}

  void _navegarParaCadastro() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => CadastroTarefascreen(onSave: _adicionarTarefa),
    //   ),
    // );
  }

  // TarefaWidget _construirWidgetTarefa(Tarefa Tarefa) {
  //   void navegar() {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => DetalheTarefascreen(
  //           Tarefa: Tarefa,
  //           widgetTarefa: _construirWidgetTarefa(Tarefa),
  //           onRemove: _removerTarefa,
  //         ),
  //       ),
  //     );
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Tarefas')),
      body: Column(
        children: [
          // Expanded(
          //   child: _isLoading
          //       ? const Center(child: CircularProgressIndicator())
          //       : GridView.builder(
          //           padding: const EdgeInsets.all(10.0),
          //           itemCount: _TarefasFiltrados.length,
          //           // PEGA OS ITENS DA LISTA E TRANSFORMA EM WIDGETS
          //           itemBuilder: (context, index) {
          //             final Tarefa = _TarefasFiltrados[index];
          //             return _construirWidgetTarefa(Tarefa);
          //           },
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //                 crossAxisCount: 4,
          //                 crossAxisSpacing: 10,
          //                 mainAxisSpacing: 10,
          //                 childAspectRatio: 0.75,
          //               ),
          //         ),
          // ),
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
