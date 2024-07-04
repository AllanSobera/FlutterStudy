import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';
import 'package:new_study/Models/dataState.dart';
import 'package:new_study/View/characterListCubit.dart';
import 'package:new_study/View/characterList.dart';
import '../Models/AppModule.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.red, Colors.orange, Colors.yellow]),
          ),
        ),
        title: const Text(
          "Personagens",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) => Modular.get<CharacterListCubit>(),
        child: BlocBuilder<CharacterListCubit, DataState>(
          builder: (context, state) {
            if (state is InicialState) {
              return const Center();
            } else if (state is LoadingState) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(40, 40, 40, 1.0),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (state is SucessedState) {
              final data = (state.data as CharactersRequestDTO);
              return Center(
                child: CharactersList(characters: data.items),
              );
            } else {
              return const Center(
                child: Text("Deu errado"),
              );
            }
          },
        ),
      ),
    );
  }
}