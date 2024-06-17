class Missao {
  final String uid;
  final String nome;
  final String categoria;
  final String objetivo;
  final String integrantes;
  final String recompensa;

  Missao(this.uid, this.nome, this.categoria,this.objetivo, this.integrantes, this.recompensa,);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'categoria': categoria,
      'objetivo': objetivo,
      'integrantes': integrantes,
      'recompensa': recompensa
    };
  }

  factory Missao.fromJson(Map<String, dynamic> json){
    return Missao(
      json['uid'],
      json['nome'],
      json['categoria'],
      json['objetivo'],
      json['integrantes'],
      json['recompensa']
    );
  }
}