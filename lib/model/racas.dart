class Raca {
  final String index;
  final String name;
  final String url;
  

  Raca(this.index, this.name, this.url,);

  //
  // Método: fromJson
  // Converter um objeto no formato JSON para um objeto Dart
  //
  factory Raca.fromJson(Map json) {
    return Raca(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
