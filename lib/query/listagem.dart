const String buscarListagemSubscription =
""" subscription MySubscription {
  listagem(order_by: {id: asc}) {
    check
    id
    subtitulo
    titulo
  }
}""";

const String updateCheckQuery =
""" mutation updateCheck(\$id:Int!,\$check:Boolean){
  update_listagem_by_pk(pk_columns: {id: \$id}, _set: {check: \$check}) {
    id
  }
}
""";

const String adicionarListagemQuery =
""" mutation adicionarListagem(\$titulo:String, \$subtitulo:String){
  insert_listagem_one(object: {subtitulo: \$subtitulo, titulo: \$titulo}) {
    id
  }
}
""";

const String deletarListagemQuery =
""" mutation MyMutation(\$id:Int!){
  delete_listagem_by_pk(id: \$id) {
    id
  }
}
""";
