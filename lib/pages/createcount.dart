import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:siagro/models/User.dart';
import 'package:siagro/provider/UserProvider.dart';
import 'package:http/http.dart' as http;
import 'package:siagro/routes/AppRouters.dart';

class CreateCount extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> createUser(String name, String email, String password) async {
    print(name);
    var res = await http.post(
        Uri.parse("http://10.0.3.2:3000/api/v1/auth/signup"),
        body: {"name": name, "email": email, "password": password});
    print(res.statusCode);

    if (res.statusCode == 201) return res.body;

    return null;
  }

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
                              controller: _nameController,
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
                              controller: _emailController,
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
                              controller: _senhaController,
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
                              controller: _confirmarSenhaController,
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
                                if (value == null ||
                                    value.isEmpty ||
                                    value != _senhaController.text) {
                                  return 'As senhas não são iguais. Tente novamente';
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
                                onPressed: () async {
                                  final isValid = _form.currentState.validate();

                                  if (isValid) {
                                    /*  _form.currentState.save();
                                  Provider.of<UsersProvider>(context,
                                          listen: false)
                                      .put(
                                    User(
                                      id: _formData['id'].toString(),
                                      name: _formData['nome'].toString(),
                                      email: _formData['email'].toString(),
                                      senha: _formData['senha'].toString(),
                                    ),
                                  );*/
                                    var name = _nameController.text;
                                    var email = _emailController.text;
                                    var password = _senhaController.text;
                                    var confirmarSenha =
                                        _confirmarSenhaController.text;

                                    /* if (confirmarSenha != password) {
                                    displayDialog(context, "An Error Occurred",
                                        "As senhas não são iguais. Tente novamente");
                                  } else { */
                                    var newUser =
                                        await createUser(name, email, password);

                                    if (newUser != null) {
                                      Navigator.pop(context);
                                    } else {
                                      displayDialog(
                                          context,
                                          "An Error Occurred",
                                          "Não foi possivel criar a conta no momento!");
                                    }
                                  }
                                }
                                //  },
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
