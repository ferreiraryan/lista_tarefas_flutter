import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/tarefas_models.dart';

class TarefaWidget extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback aoRemover;
  final VoidCallback aoAlternarConclusao;

  const TarefaWidget({
    super.key,
    required this.tarefa,
    required this.aoRemover,
    required this.aoAlternarConclusao,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                tarefa.titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tarefa.descricao,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              CheckboxListTile(
                value: tarefa.concluida,
                onChanged: (_) => aoAlternarConclusao(),
                title: const Text("Concluída?"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              IconButton(
                onPressed: aoRemover,
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
