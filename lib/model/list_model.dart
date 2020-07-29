class ListModel {
  bool check;
  int id;
  String subtitulo;
  String titulo;

  ListModel({this.check, this.id, this.subtitulo, this.titulo});

  ListModel.fromJson(Map<String, dynamic> json) {
    check = json['check'];
    id = json['id'];
    subtitulo = json['subtitulo'];
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check'] = this.check;
    data['id'] = this.id;
    data['subtitulo'] = this.subtitulo;
    data['titulo'] = this.titulo;
    return data;
  }
  static List<ListModel> fromJsonList(List list){
    if(list == null) return null;
    return list
        .map((item) => ListModel.fromJson(item))
        .toList();
  }
}
