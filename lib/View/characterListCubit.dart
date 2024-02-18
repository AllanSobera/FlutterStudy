import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';
import '../Models/dataState.dart';
import '../Models/Service/Service.dart';

class CharacterListCubit extends Cubit<DataState> {
  static const valueKey = ValueKey("characterListCubit");
  final DragonBallAPI service;

  CharacterListCubit({required this.service}) : super(InicialState()) {
    _getDragonBallCharacters();
  }

  void _getDragonBallCharacters() async {
    emit(LoadingState());

    final result = await service.fetchCharacters();

    if (result.statusCode == 400) {
      emit(Error(descriptionError: "BadRequest"));
    } else if (result.statusCode == 401) {
      emit(Error(descriptionError: "Unauthorized"));
    } else if (result.statusCode == 503) {
      emit(Error(descriptionError: "Server error"));
    }

    Map<String, dynamic> decoded = jsonDecode(result.body);

    final data = CharactersRequestDTO.fromJson(decoded);
    emit(SucessedState(data: data));
  }
}