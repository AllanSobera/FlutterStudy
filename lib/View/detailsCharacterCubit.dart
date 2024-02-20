import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';
import 'package:new_study/Models/DTO/characterDetailsDTO.dart';
import '../Models/dataState.dart';
import '../Models/Service/Service.dart';

class DetailsCharacterCubit extends Cubit<DataState> {
  static const valueKey = ValueKey("DetailsCharacterCubit");
  final DragonBallAPI service;
  final int characterId;

  DetailsCharacterCubit({required this.service, required this.characterId}) : super(InicialState()) {
    _getDragonBallCharacterDetails(characterId);
  }

  void _getDragonBallCharacterDetails(int id) async {
    emit(LoadingState());

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final result = await service.fetchCharacterDetails(id);

    if (result.statusCode == 400) {
      emit(Error(descriptionError: "BadRequest"));
    } else if (result.statusCode == 401) {
      emit(Error(descriptionError: "Unauthorized"));
    } else if (result.statusCode == 503) {
      emit(Error(descriptionError: "Server error"));
    }

    Map<String, dynamic> decoded = jsonDecode(result.body);

    final data = CharacterDetailsDTO.jsonFrom(decoded);
    emit(SucessedState(data: data));
  }
}