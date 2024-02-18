
import 'package:new_study/Models/DTO/CharactersRequest.dart';

abstract class DataState {}

class InicialState extends DataState {}

class LoadingState extends DataState {}

class SucessedState extends DataState {
  SucessedState({required this.data});
  final CharactersRequestDTO data;
}

class Error extends DataState {
  Error({required this.descriptionError});
  final String descriptionError;
}