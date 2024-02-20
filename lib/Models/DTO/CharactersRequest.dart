// ignore: file_names
import 'package:new_study/Models/dataState.dart';

class CharactersRequestDTO extends GenericData {
  final List<CharacterDTO> items;
  final MetaDTO meta;
  final LinksDTO links;

  CharactersRequestDTO({
    required this.items,
    required this.meta,
    required this.links,
  });

  factory CharactersRequestDTO.fromJson(Map<String, dynamic> json) {
    var items = json['items'] as List;
    var itemsDto = items.map((e) => CharacterDTO.jsonFrom(e));
    return CharactersRequestDTO(
      items: itemsDto.toList(),
      meta: MetaDTO.fromJson(json['meta']),
      links: LinksDTO.fromJson(json['links']),
    );
  }
}

class MetaDTO {
  final int totalItems;
  final int itemCount;
  final int itemsPerPage;
  final int totalPages;
  final int currentPage;

  MetaDTO(
      {required this.totalItems,
      required this.itemCount,
      required this.itemsPerPage,
      required this.totalPages,
      required this.currentPage});

  factory MetaDTO.fromJson(Map<String, dynamic> json) {
    return MetaDTO(
      totalItems: json['totalItems'],
      itemCount: json['itemCount'],
      itemsPerPage: json['itemsPerPage'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
    );
  }
}

class LinksDTO {
  final String first;
  final String previous;
  final String next;
  final String last;

  LinksDTO(
      {required this.first,
      required this.previous,
      required this.next,
      required this.last});

  factory LinksDTO.fromJson(Map<String, dynamic> json) {
    return LinksDTO(
        first: json['first'],
        previous: json['previous'],
        next: json['next'],
        last: json['last']);
  }
}

class CharacterDTO {
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

  CharacterDTO(
      {required this.id,
      required this.name,
      required this.ki,
      required this.maxKi,
      required this.race,
      required this.gender,
      required this.description,
      required this.image,
      required this.affiliation,
      this.deletedAt});

  factory CharacterDTO.jsonFrom(Map<String, dynamic> json) {
    return CharacterDTO(
        id: json['id'],
        name: json['name'],
        ki: json['ki'],
        maxKi: json['maxKi'],
        race: json['race'],
        gender: json['gender'],
        description: json['description'],
        image: json['image'],
        affiliation: json['affiliation'],
        deletedAt: json['deletedAt']);
  }
}

