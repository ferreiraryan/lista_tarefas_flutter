import 'package:flutter/material.dart';

class Tarefa {
  String titulo;
  String descricao;
  bool concluida;
  Color corFundo;

  Tarefa({
    required this.titulo,
    required this.descricao,
    this.concluida = false,
    this.corFundo = Colors.white,
  });
}
