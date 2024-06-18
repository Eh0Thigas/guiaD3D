class Historia {
  final String uid;
  final String nome;
  final String objetivo;
  final String personagens;
  final String enredo;
  final String local;

  Historia(this.uid, this.nome, this.objetivo,this.personagens, this.enredo, this.local,);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'objetivo': objetivo,
      'personagens': personagens,
      'enredo': enredo,
      'local': local
    };
  }

  factory Historia.fromJson(Map<String, dynamic> json){
    return Historia(
      json['uid'],
      json['nome'],
      json['objetivo'],
      json['personagens'],
      json['enredo'],
      json['local']
    );
  }
}