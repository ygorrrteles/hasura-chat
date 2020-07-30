import 'package:estudos_hasura/controller/login_controller.dart';
import 'package:estudos_hasura/pages/listagem.dart';
import 'package:estudos_hasura/pages/login_page.dart';
import 'package:estudos_hasura/repository/usuario_repository.dart';
import 'file:///D:/Repositorio/hasura-chat/lib/controller/listagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:asuka/asuka.dart' as asuka;

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ListagemController>(ListagemController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: Listagem(),
      home: LoginPage(),
    );
  }
}
