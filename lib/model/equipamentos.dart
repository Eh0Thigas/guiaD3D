class Equipamentos {
  final String index;
  final String name;
  final String url;
  

  Equipamentos(this.index, this.name, this.url,);

  //
  // Método: fromJson
  // Converter um objeto no formato JSON para um objeto Dart
  //
  factory Equipamentos.fromJson(Map json) {
    return Equipamentos(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
