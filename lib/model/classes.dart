class Classes {
  final String index;
  final String name;
  final String url;
  

  Classes(this.index, this.name, this.url,);

  //
  // Método: fromJson
  // Converter um objeto no formato JSON para um objeto Dart
  //
  factory Classes.fromJson(Map json) {
    return Classes(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
