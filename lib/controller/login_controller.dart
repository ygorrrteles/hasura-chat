import 'package:estudos_hasura/model/usuario_model.dart';
import 'package:estudos_hasura/repository/usuario_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:asuka/asuka.dart' as asuka;

class LoginController {
  final usuarioRepository = UsuarioImpl();
  bool carregando = false;
  TextEditingController usuario = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  UsuarioModel usuarioConectado = new UsuarioModel();

  Future<UsuarioModel> login() async {
    UsuarioModel usuarioModel = new UsuarioModel();
    usuarioModel.login = usuario.text;
    usuarioModel.senha = senha.text;

    UsuarioModel response = await usuarioRepository.buscarLogin(usuarioModel);

    if (response?.login != null) {
      response = await usuarioRepository.buscarUm(usuarioModel);
      usuarioConectado = response;
      return response;
    } else{
      asuka.showSnackBar(
        SnackBar(
          content: Text("Usuario não existe"),
        ),
      );
      throw Exception("Usuario não existe");
    }
  }

  Future<UsuarioModel> criarUsuario() async {
    UsuarioModel usuarioModel = new UsuarioModel();
    usuarioModel.login = usuario.text;
    usuarioModel.senha = senha.text;

    UsuarioModel response = await usuarioRepository.buscarLogin(usuarioModel);
    if (response?.login != null) {
      asuka.showSnackBar(
        SnackBar(
          content: Text("usuario ja existe"),
        ),
      );
      throw Exception("usuario ja existe");
    } else {
      response = await usuarioRepository.criar(usuarioModel);
      usuarioConectado = response;
      return response;
    }
  }
}
