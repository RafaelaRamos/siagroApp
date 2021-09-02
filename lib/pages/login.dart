import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:siagro/main.dart';
import 'package:siagro/pages/ListPropriedades.dart';
import 'package:siagro/routes/AppRouters.dart';

class Login extends StatelessWidget {
  final storage = FlutterSecureStorage();
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> attemptLogIn(String username, String password) async {
    var res = await http.post(
        Uri.parse("http://10.0.3.2:3000/api/v1/auth/login"),
        body: {"username": username, "password": password});
    print(res.statusCode);

    if (res.statusCode == 201) return res.body;

    return null;
  }

  /*Future<int> attemptSignUp(String username, String password) async {
    var res = await http.post('$SERVER_IP/signup',
        body: {"username": username, "password": password});
    return res.statusCode;
  }
*/
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
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          child: Form(
            key: _form,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80, child: Image.asset('assets/agro.png')),
                  SizedBox(
                    height: 20,
                  ),
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
                        Text('SiAgro',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Realize Login',
                            style:
                                TextStyle(fontSize: 15, color: Colors.green)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        Container(
                          width: 250,
                          child: TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Senha",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 20,
                          child: TextButton(
                            child: Text(
                              "Recuperar Senha",
                              textAlign: TextAlign.right,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 60,
                          width: 250,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Entrar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                var username = _usernameController.text;
                                var password = _passwordController.text;
                                Navigator.pushNamed(
                                    context, AppRouters.LISTAPROPRIEDADES);

                                /* var jwt =
                                    await attemptLogIn(username, password);
                                print(jwt);
                                if (jwt != null) {
                                  storage.write(key: "jwt", value: jwt);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListPropriedades.fromBase64(
                                                  jwt)));
                                } else {
                                  displayDialog(context, "An Error Occurred",
                                      "No account was found matching that username and password");
                                }*/
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            child: Text(
                              "Cadastre-se",
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRouters.CREATECOUNT,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          )),
    ));
  }
}
