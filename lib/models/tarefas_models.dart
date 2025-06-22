class Tarefa {
  final String titulo;
  final String descricao;
  bool concluida;

  Tarefa({
    required this.titulo,
    required this.descricao,
    this.concluida = false,
  });
}
