class Dano {
  final String index;
  final String name;
  final String url;
  

  Dano(this.index, this.name, this.url,);

  //
  // Método: fromJson
  // Converter um objeto no formato JSON para um objeto Dart
  //
  factory Dano.fromJson(Map json) {
    return Dano(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
