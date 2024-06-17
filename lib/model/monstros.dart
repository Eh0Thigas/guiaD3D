class Monstros {
  final String index;
  final String name;
  final String url;
  

  Monstros(this.index, this.name, this.url,);

  //
  // Método: fromJson
  // Converter um objeto no formato JSON para um objeto Dart
  //
  factory Monstros.fromJson(Map json) {
    return Monstros(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
