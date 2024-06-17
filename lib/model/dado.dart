class Dado {
  final String uid;
  final String nome;
  final String valor;
  final String objetivo;
  final String ultilizadores;
  final String critico;

  Dado(this.uid, this.nome, this.valor,this.objetivo, this.ultilizadores, this.critico,);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'valor': valor,
      'objetivo': objetivo,
      'ultilizadores': ultilizadores,
      'critico': critico
    };
  }

  factory Dado.fromJson(Map<String, dynamic> json){
    return Dado(
      json['uid'],
      json['nome'],
      json['valor'],
      json['objetivo'],
      json['ultilizadores'],
      json['critico']
    );
  }
}