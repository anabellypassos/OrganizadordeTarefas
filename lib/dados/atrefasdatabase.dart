class Atrefasdatabase {
  final int? id;
  final String nametarefa;
  final String descricao;
  bool concluida;

  Atrefasdatabase({this.id, required this.nametarefa, required this.descricao,this.concluida = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nametarefa': nametarefa,
      'descricao': descricao,
      'concluida': concluida ? 1 : 0   }; // Converter para inteiro
  }

  factory Atrefasdatabase.fromMap(Map<String, dynamic> map) {
    return Atrefasdatabase(
      id: map['id'],
      nametarefa: map['nametarefa'],
      descricao: map['descricao'],
      concluida: map['concluida']== 1,// Converter de inteiro para booleano
    );
  }
}
