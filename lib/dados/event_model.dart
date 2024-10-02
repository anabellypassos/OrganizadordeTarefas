/*id: Um campo opcional (pode ser null), que armazena o identificador
 único do evento. Ele é do tipo int e é geralmente gerado automaticamente 
 pelo banco de dados.
name: O nome do evento, que é obrigatório (usa required).
date: A data do evento, também obrigatória, armazenada como uma string. */

class EventModel {
  final int? id;
  final String name;
  final String date;

  /*Esse é o construtor da classe EventModel.
this.id: Como o campo id é opcional (int?), você pode criar um objeto
 EventModel sem especificar o id. Isso é útil, por exemplo, quando você
  está inserindo um novo evento e o id ainda não foi gerado.
required this.name e required this.date: Ambos os atributos name e date
 são obrigatórios quando você cria um novo objeto dessa classe. 
 */

  EventModel({this.id, required this.name, required this.date});


/*
toMap(): Este método converte o objeto EventModel em um mapa
 (Map<String, dynamic>).
Isso é necessário para inserir ou atualizar os dados no banco 
de dados SQLite, pois o banco de dados trabalha com mapas de
 chave-valor.
As chaves do mapa ('id', 'name', 'date') são os nomes das 
colunas na tabela do banco de dados.
 */
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
    };
  }


/*fromMap(): Este é um construtor de fábrica, que cria uma 
instância de EventModel a partir de um mapa de dados.
Ele é útil ao recuperar dados do banco de dados, já que o
 SQLite retorna resultados de consulta na forma de mapas.
Os valores do mapa (map['id'], map['name'], map['date']) 
são usados para preencher os atributos do objeto EventModel.

 */
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      name: map['name'],
      date: map['date'],
    );
  }
}
