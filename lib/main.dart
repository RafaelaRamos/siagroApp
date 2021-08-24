import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/controllers/GetMap.dart';
import 'package:siagro/pages/CreatePropriedade.dart';
import 'package:siagro/pages/ListPropriedades.dart';
import 'package:siagro/pages/PropriedadeDetails.dart';
import 'package:siagro/pages/createcount.dart';
import 'package:siagro/pages/login.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';

import 'pages/GetMapPolymaker.dart';
import 'routes/AppRouters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => PropriedadesProvider(),
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
              AppRouters.CREATEPROPRIEDADE: (_) => CreatePropriedade(),
              AppRouters.GETMAP: (_) => GetMaps(),
              AppRouters.GETMAPOLYGON: (_) => GetPolymakerMaps(),
              //  AppRouters.CREATEMODULO: (_) => CreateModulo()
            }));
  }
}
