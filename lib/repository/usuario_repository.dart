import 'package:estudos_hasura/model/usuario_model.dart';
import 'package:estudos_hasura/query/hasuraConnection.dart';
import 'package:estudos_hasura/query/usuario.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:asuka/asuka.dart' as asuka;

abstract class UsuarioRepository {
  Future<UsuarioModel> criar(UsuarioModel usuario);
  Future<UsuarioModel> buscarUm(UsuarioModel usuario);
  Future<UsuarioModel> buscarLogin(UsuarioModel usuario);
  Future<void> deletar(UsuarioModel usuario);
  Future<void> ListarTodos(UsuarioModel usuario);
}

class UsuarioImpl extends UsuarioRepository{
  final HasuraConnect connect = HasuraConnect(HasuraUrl, headers: HasuraHeader);

  @override
  Future<UsuarioModel> criar(UsuarioModel usuario) async {
    try{
      print("criando usuario => ${usuario.login}");
      var response = await connect.mutation(criarUsuarioQuery, variables: {"login": usuario.login.trim(), "senha": usuario.senha.trim()});
      UsuarioModel usuarioModel = UsuarioModel.fromJson(response["data"]["insert_usuario_one"]);
      print("usuário criado => ${usuarioModel.login}");
      return usuarioModel;
    } catch(ex) {
      print("falha ao criar usuario");
    }
  }

  @override
  Future<void> ListarTodos(UsuarioModel usuario) {
    // TODO: implement ListarTodos
    throw UnimplementedError();
  }

  @override
  Future<UsuarioModel> buscarUm(UsuarioModel usuario) async {

    try{
      print("buscando usuario => ${usuario.login}");
      var response = await connect.query(buscarUsuarioQuery, variables: {"login": usuario.login.trim(), "senha": usuario.senha.trim()});
      UsuarioModel usuarioModel = UsuarioModel.fromJson(response["data"]["usuario"][0]);
      return usuarioModel;
    } catch (ex){
      print("usuario não encontrado");
      asuka.showSnackBar(
        SnackBar(
          content: Text("usuario e senha não conferem"),
        ),
      );
      throw Exception("usuario e senha não conferem");
    }
  }

  @override
  Future<void> deletar(UsuarioModel usuario) {
    // TODO: implement deletar
    throw UnimplementedError();
  }

  @override
  Future<UsuarioModel> buscarLogin(UsuarioModel usuario) async {
    try{
      print("buscando login => ${usuario.login}");
      var response = await connect.query(buscarLoginQuery, variables: {"login": usuario.login.trim()});
      UsuarioModel usuarioModel = UsuarioModel.fromJson(response["data"]["usuario"][0]);
      print("login encontrado => ${usuarioModel.login}");
      return usuarioModel;
    }catch (ex) {
      print("Usuário não existe");
    }
  }
}