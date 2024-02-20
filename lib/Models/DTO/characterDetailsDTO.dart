import 'package:new_study/Models/dataState.dart';

class CharacterDetailsDTO extends GenericData {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final String gender;
  final String description;
  final String image;
  final String affiliation;
  final String? deletedAt;
  final PlanetDTO originPlanet;
  final List<TransformationDTO> transformations;

  CharacterDetailsDTO({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
    this.deletedAt,
    required this.originPlanet,
    required this.transformations,
  });

  factory CharacterDetailsDTO.jsonFrom(Map<String, dynamic> json) {
    return CharacterDetailsDTO(
        id: json["id"],
        name: json["name"], 
        ki: json["ki"], 
        maxKi: json["maxKi"], 
        race: json["race"], 
        gender: json["gender"], 
        description: json["description"], 
        image: json["image"], 
        affiliation: json["affiliation"],
        deletedAt: json["deletedAt"],
        originPlanet: json["originPlanet"],
        transformations: json["transformations"]
    );
  }
}

class PlanetDTO {
  final int id;
  final String name;
  final bool isDestroyed;
  final String description;
  final String image;
  final String? deletedAt;

  PlanetDTO({
    required this.id,
    required this.name,
    required this.isDestroyed,
    required this.description,
    required this.image,
    this.deletedAt,
  });

  factory PlanetDTO.jsonFrom(Map<String, dynamic> json) {
    return PlanetDTO(
        id: json["id"],
        name: json["name"],
        isDestroyed: json["isDestroyed"],
        description: json["description"],
        image: json["image"]
    );
  }
}

class TransformationDTO {
  final int id;
  final String name;
  final String image;
  final String ki;
  final String? deletedAt;

  TransformationDTO({
    required this.id,
    required this.name,
    required this.image,
    required this.ki,
    this.deletedAt,
  });
  
  factory TransformationDTO.jsonFrom(Map<String, dynamic> json) {
    return TransformationDTO(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        ki: json["ki"],
        deletedAt: json["deletedAt"]
    );
  }  
}