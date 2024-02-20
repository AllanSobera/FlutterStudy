import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';
import 'package:new_study/Models/dataState.dart';
import 'package:new_study/View/CharacterCell.dart';
import 'characterListCubit.dart';
import 'package:new_study/View/home.dart';
import '../Models/AppModule.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(38, 129, 106, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      builder: (context, router) {
        return router!;
      },
    );
  }
}
