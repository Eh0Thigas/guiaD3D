class Personagem {
  final String uid;
  final String nome;
  final String raca;
  final String classe;
  final String equipamento;
  final String feitico;

  Personagem(this.uid, this.nome, this.raca, this.classe, this.equipamento, this.feitico);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'raca': raca,
      'classe': classe,
      'equipamento': equipamento,
      'feitico': feitico
    };
  }

  factory Personagem.fromJson(Map<String, dynamic> json){
    return Personagem(
      json['uid'],
      json['nome'],
      json['raca'],
      json['classe'],
      json['equipamento'],
      json['feitico']
    );
  }
}