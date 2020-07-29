import 'package:estudos_hasura/pages/listagem.dart';
import 'package:estudos_hasura/pages/listagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hasura_connect/hasura_connect.dart';

void main() {
//  HasuraConnect connect = new HasuraConnect("http://192.168.1.2:8080/v1/graphql");
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ListagemController>(ListagemController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.amber,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Listagem(),
    );
  }
}
