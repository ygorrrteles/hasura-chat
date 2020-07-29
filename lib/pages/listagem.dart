import 'package:estudos_hasura/model/list_model.dart';
import 'package:estudos_hasura/pages/listagem_controller.dart';
import 'package:estudos_hasura/repository/listagem_imlp.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hasura_connect/hasura_connect.dart';

class Listagem extends StatelessWidget {
  ListagemImpl listagemImpl = ListagemImpl();
  final controller = GetIt.I.get<ListagemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estudando Hasura!!!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialogAddModel(context, listagemImpl),
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<List<ListModel>>(
        stream: listagemImpl.buscarListagem(),
        initialData: List<ListModel>(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                ListModel model = snapshot.data[index];
                return ListTile(
                  onLongPress: () async {
                    _showDialogDeleteModel(context, listagemImpl, model);
                  },
                  title: Text("${model.id} ${model.titulo}"),
                  subtitle: Text(model.subtitulo),
                  trailing: Checkbox(
                    value: model.check,
                    onChanged: (value) async {
                      await listagemImpl.isCheck(model);
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _showDialogAddModel(BuildContext context, ListagemImpl listagemImpl) {
    final controller = GetIt.I.get<ListagemController>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: controller.titulo,
                decoration: InputDecoration(labelText: "Titulo", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.subtitulo,
                decoration: InputDecoration(labelText: "Subtitulo", border: OutlineInputBorder()),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new RaisedButton(
              color: Theme.of(context).primaryColor,
              child: new Text("Criar"),
              onPressed: () async {
                await listagemImpl.adicionar();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  _showDialogDeleteModel(BuildContext context, ListagemImpl listagemImpl, ListModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Deletar"),
          content: Text("Deseja deletar ${model.titulo}"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new RaisedButton(
              color: Theme.of(context).primaryColor,
              child: new Text("deletar"),
              onPressed: () async {
                await listagemImpl.deletar(model);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
