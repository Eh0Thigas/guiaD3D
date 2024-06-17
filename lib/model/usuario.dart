class Usuario {
  final String uid;
  final String nome;
  final String telefone;
  final String cpf;
  final String nickname;

  Usuario(this.uid, this.nome, this.telefone, this.cpf, this.nickname);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'telefone': telefone,
      'cpf': cpf,
      'nickname': nickname
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
      json['uid'],
      json['nome'],
      json['telefone'],
      json['cpf'],
      json['nickname']
    );
  }
}