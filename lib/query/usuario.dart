const String criarUsuarioQuery = """ 
mutation inserirUsuario(\$login:String,\$senha:String){
  insert_usuario_one(object: {login: \$login, nome_amigavel: \$login, senha: \$senha, email: \$login}) {
    id
    email
    foto
    login
    nome_amigavel
  }
}
 """;
const String buscarUsuarioQuery = """ 
query buscarUsuario(\$login:String,\$senha:String){
  usuario(where: {login: {_eq: \$login}, _and: {senha: {_eq: \$senha}}}) {
    email
    foto
    id
    login
    nome_amigavel
  }
}
 """;
const String buscarLoginQuery = """ 
query buscarLogin(\$login: String) {
  usuario(where: {login: {_eq: \$login}}) {
    email
    foto
    id
    login
    nome_amigavel
  }
}
 """;