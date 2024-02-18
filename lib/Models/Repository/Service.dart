import 'dart:io';
import 'package:http/http.dart' as http;

class DragonBallAPI {
  DragonBallAPI();

  Future<http.Response> fetchCharacters() async {
    return http.get(Uri.parse("${RoutesAPI.baseUrl}${RoutesAPI.characters}"));
  }
}

class RoutesAPI {
  static const String baseUrl = "https://www.dragonball-api.com/api/";
  static const String characters = "characters";
  static const String planets = "planets";
}