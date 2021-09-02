import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/pages/CreateModulo.dart';
import 'package:siagro/pages/CreatePropriedade.dart';
import 'package:siagro/pages/ListModulos.dart';
import 'package:siagro/pages/ListPropriedades.dart';
import 'package:siagro/pages/PropriedadeDetails.dart';
import 'package:siagro/pages/ShowModulo.dart';
import 'package:siagro/pages/createcount.dart';
import 'package:siagro/pages/getMap.dart';
import 'package:siagro/pages/login.dart';
import 'package:siagro/provider/ModuloProvider.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'routes/AppRouters.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;
//import 'dart:convert' show json, base64, ascii;

//const SERVER_IP = 'http://10.0.3.2:3000/api/v1/';
final storage = FlutterSecureStorage();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");

    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PropriedadesProvider>.value(
              value: PropriedadesProvider()),
          ChangeNotifierProvider<ModuloProvider>.value(
            value: ModuloProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            routes: {
              AppRouters.HOME: (_) => Login(),
              AppRouters.CREATECOUNT: (_) => CreateCount(),
              AppRouters.DETAILS: (_) => PropriedadeDetails(),
              AppRouters.LISTAPROPRIEDADES: (_) => ListPropriedades(),
              AppRouters.LISTAMODULO: (_) => ListModulos(),
              AppRouters.CREATEPROPRIEDADE: (_) => CreatePropriedade(),
              AppRouters.CREATEMODULO: (_) => CreateModulo(),
              AppRouters.SHOWMODULO: (_) => ShowModulo(),
              AppRouters.GETMAP: (_) => GetMap(),

              //  AppRouters.CREATEMODULO: (_) => CreateModulo()
            }));
    /*
          home: FutureBuilder(
              future: jwtOrEmpty,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                if (snapshot.data != "") {
                  var str = snapshot.data;
                  var jwt = str.split(".");

                  if (jwt.length != 3) {
                    return Login();
                  } else {
                    var payload = json.decode(
                        ascii.decode(base64.decode(base64.normalize(jwt[1]))));
                    if (DateTime.fromMillisecondsSinceEpoch(
                            payload["exp"] * 1000)
                        .isAfter(DateTime.now())) {
                      return ListPropriedades(str, payload);
                    } else {
                      return Login();
                    }
                  }
                } else {
                  return Login();
                }
              }),
        ));
        */
  }
}
