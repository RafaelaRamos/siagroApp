import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:siagro/models/User.dart';
import 'package:siagro/provider/UserProvider.dart';

class CreateCount extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF32CD32),
                  Color(0XFF3CB371),
                  Color(0xFFADFF2F),
                ]),
          ),
          padding: EdgeInsets.only(top: 100, left: 40, right: 40),
          child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 480,
                    width: 325,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 250,
                            child: TextFormField(
                              // autofocus: true,

                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Nome",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '* Campo obrigatório';
                                }
                              },
                              onSaved: (value) => _formData['Nome'] = value,

                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 250,
                            child: TextFormField(
                              // autofocus: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '* Campo obrigatório';
                                }
                              },
                              onSaved: (value) => _formData['email'] = value,

                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 250,
                            child: TextFormField(
                              // autofocus: true,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Senha",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '* Campo obrigatório';
                                }
                              },
                              onSaved: (value) => _formData['senha'] = value,
                              style: TextStyle(fontSize: 20),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 250,
                            child: TextFormField(
                              // autofocus: true,
                              keyboardType: TextInputType.text,
                              obscureText: true,

                              decoration: InputDecoration(
                                labelText: " Confirmar senha",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '* Campo obrigatório';
                                }
                              },
                              onSaved: (value) =>
                                  _formData['confirmarSenha'] = value,

                              style: TextStyle(fontSize: 20),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [
                                Color(0xFF32CD32),
                                Color(0XFF3CB371),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                final isValid = _form.currentState.validate();
                                if (isValid) {
                                  _form.currentState.save();
                                  Provider.of<UsersProvider>(context,
                                          listen: false)
                                      .put(
                                    User(
                                      id: _formData['id'].toString(),
                                      name: _formData['nome'].toString(),
                                      email: _formData['email'].toString(),
                                      senha: _formData['senha'].toString(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: TextButton(
                            child: Text(
                              "Cancelar",
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    ));
  }
}
