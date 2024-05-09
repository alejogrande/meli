import 'package:challenge_meli/ui/pages/home/bloc/home_bloc.dart';
import 'package:challenge_meli/ui/pages/home/home_page.dart';
import 'package:challenge_meli/ui/pages/product_detail/bloc/product_detail_bloc.dart';
import 'package:challenge_meli/ui/pages/search_list/bloc/search_list_bloc.dart';
import 'package:challenge_meli/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa este paquete

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection/injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  SystemChrome.setPreferredOrientations([
    // Configura las orientaciones preferidas
    DeviceOrientation.portraitUp, // Retrato normal
    // DeviceOrientation.portraitDown, // Retrato invertido
    DeviceOrientation.landscapeLeft, // Paisaje a la izquierda
    DeviceOrientation.landscapeRight, // Paisaje a la derecha
  ]).then((_) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<HomeBloc>()),
        BlocProvider(create: (_) => di.locator<ProductDetailBloc>()),
        BlocProvider(create: (_) => di.locator<SearchListBloc>()),
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meli-app',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: ThemeData(primaryColor: Colors.red),
      home: const HomePage(),
    );
  }
}
