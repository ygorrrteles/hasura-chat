
import 'package:estudos_hasura/model/list_model.dart';

abstract class ListagemRepository{
 Stream<List<ListModel>> buscarListagem();
}