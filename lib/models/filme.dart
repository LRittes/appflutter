class Filme {
  int? id;
  String? name;
  String? sinopse;
  int? duracaoMinutos;
  bool? maior18;

  Filme({this.id, this.name, this.sinopse, this.duracaoMinutos, this.maior18});

  Filme.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sinopse = json['sinopse'];
    duracaoMinutos = json['duracaoMinutos'];
    maior18 = json['maior18'];
  }
}
