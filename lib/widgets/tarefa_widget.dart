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
    return Card(
      color: tarefa.corFundo,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    tarefa.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: tarefa.concluida
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
                Checkbox(
                  value: tarefa.concluida,
                  onChanged: (_) => aoAlternarConclusao(),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(tarefa.descricao),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: aoRemover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
