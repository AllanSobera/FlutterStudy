import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../Models/dataState.dart';
import '../Models/Repository/Service.dart';

class CharacterListCubit extends Cubit<DataState> {
  static const valueKey = ValueKey("characterListCubit");
  final DragonBallAPI service;

  CharacterListCubit({required this.service}) : super(InicialState()) {
    _getDragonBallCharacters();
  }

  void _getDragonBallCharacters() async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 5));

    emit(SucessedState());
  }
}