import 'dart:convert';

import 'package:estudos_hasura/model/list_model.dart';
import 'package:estudos_hasura/query/hasuraConnection.dart';
import 'file:///D:/Repositorio/hasura-chat/lib/controller/listagem_controller.dart';
import 'package:estudos_hasura/query/listagem.dart';
import 'package:estudos_hasura/repository/listagem_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ListagemImpl {
  final HasuraConnect connect = HasuraConnect(HasuraUrl, headers: HasuraHeader);
  final controller = GetIt.I.get<ListagemController>();

  Stream<List<ListModel>> buscarListagem() {
    Snapshot snapshot = connect.subscription(buscarListagemSubscription);
    return snapshot.map(
      (jsonList) => ListModel.fromJsonList(jsonList["data"]["listagem"]),
    );
  }

  Future isCheck(ListModel model) async {

    connect.mutation(updateCheckQuery, variables: {"id": model.id, "check": !model.check});
  }

  Future adicionar() async {
    connect.mutation(adicionarListagemQuery, variables: {"titulo": controller.titulo.text, "subtitulo": controller.subtitulo.text});
    controller.titulo.clear();
    controller.subtitulo.clear();
  }

  Future deletar(ListModel model) async {
    connect.mutation(deletarListagemQuery, variables: {"id": model.id});
  }
}
