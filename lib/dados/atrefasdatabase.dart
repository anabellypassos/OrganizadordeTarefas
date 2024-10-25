class Atrefasdatabase {
  final int? id;
  final String nametarefa;
  final String descricao;

  Atrefasdatabase({this.id, required this.nametarefa, required this.descricao});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nametarefa': nametarefa,
      'descricao': descricao,
      
    };
  }

  factory Atrefasdatabase.fromMap(Map<String, dynamic> map) {
    return Atrefasdatabase(
      id: map['id'],
      nametarefa: map['nametarefa'],
      descricao: map['descricao'],
    );
  }
}
