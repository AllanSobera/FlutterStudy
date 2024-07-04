import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';
import 'package:new_study/View/CharacterCell.dart';
import 'package:new_study/View/detailsScreen.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key, required this.characters});

  final List<CharacterDTO> characters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(40, 40, 40, 1.0),
        ),
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: CharacterCell(
                character: characters[index],
                cellDidTap: (id) {
                  // Modular.to.pushNamed(DetailsScreen.screenRoute, arguments: id);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
