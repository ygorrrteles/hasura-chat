class UsuarioModel {
  int id;
  String email;
  String foto;
  String login;
  String nomeAmigavel;
  String senha;

  UsuarioModel({this.id, this.email, this.foto, this.login, this.nomeAmigavel, this.senha});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    foto = json['foto'];
    login = json['login'];
    nomeAmigavel = json['nome_amigavel'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['foto'] = this.foto;
    data['login'] = this.login;
    data['nome_amigavel'] = this.nomeAmigavel;
    data['senha'] = this.senha;
    return data;
  }
  static List<UsuarioModel> fromJsonList(List list){
    if(list == null) return null;
    return list
        .map((item) => UsuarioModel.fromJson(item))
        .toList();
  }
}
