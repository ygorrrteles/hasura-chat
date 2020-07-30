import 'package:estudos_hasura/animation/FadeAnimation.dart';
import 'package:estudos_hasura/controller/listagem_controller.dart';
import 'package:estudos_hasura/controller/login_controller.dart';
import 'package:estudos_hasura/model/usuario_model.dart';
import 'package:estudos_hasura/pages/listagem.dart';
import 'package:estudos_hasura/repository/usuario_repository.dart';
import 'package:estudos_hasura/utils/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  final loginController = LoginController();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-1.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-2.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10))]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[100]))),
                                child: TextField(
                                  controller: widget.loginController.usuario,
                                  decoration:
                                      InputDecoration(border: InputBorder.none, hintText: "Usuario", hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: widget.loginController.senha,
                                  decoration:
                                      InputDecoration(border: InputBorder.none, hintText: "Senha", hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      !widget.loginController.carregando ? Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FlatButton(
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                widget.loginController.carregando = true;
                              });
                              try{
                                await widget.loginController.login();
                                push(
                                  context,
                                  Listagem(
                                    loginController: widget.loginController,
                                  ),
                                );
                              }catch (ex){
                                print(ex);
                              }finally{
                                setState(() {
                                  widget.loginController.carregando = false;
                                });
                              }
                            },
                            child: Center(
                              child: Text(
                                "Logar",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ) : LinearProgressIndicator(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      !widget.loginController.carregando ? Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FlatButton(
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                widget.loginController.carregando = true;
                              });
                              try{
                                await widget.loginController.criarUsuario();
                                push(
                                  context,
                                  Listagem(
                                    loginController: widget.loginController,
                                  ),
                                );
                              }catch (ex){
                                print(ex);
                              }finally{
                                setState(() {
                                  widget.loginController.carregando = false;
                                });
                              }
                            },
                            child: Center(
                              child: Text(
                                "Criar",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ) : LinearProgressIndicator(),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FadeAnimation(
                      1.5,
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
