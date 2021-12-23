class Pessoa {
  int? id;
  String? name;

  Pessoa({this.id, this.name});

  Pessoa.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
