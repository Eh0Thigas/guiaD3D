class Condicoes {
  final String index;
  final String name;
  final String url;
  

  Condicoes(this.index, this.name, this.url,);

  //
  // Método: fromJson
  // Converter um objeto no formato JSON para um objeto Dart
  //
  factory Condicoes.fromJson(Map json) {
    return Condicoes(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
