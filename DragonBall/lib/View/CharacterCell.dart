import 'package:flutter/material.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';

class CharacterCell extends StatelessWidget {
  final CharacterDTO character;
  final Function(int id) cellDidTap;

  const CharacterCell({super.key, required this.character, required this.cellDidTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cellDidTap(character.id),
      child: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(character.image),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: const Color.fromRGBO(223, 223, 223, 1.0),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color.fromRGBO(57, 57, 57, 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  TextDescription(title: "Name:", description: character.name),
                  TextDescription(title: "Base KI:", description: character.ki),
                  TextDescription(
                      title: "Total KI:", description: character.maxKi),
                  TextDescription(
                      title: "Afilliantion:", description: character.affiliation),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextDescription extends StatelessWidget {
  final String title;
  final String description;

  const TextDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            color: Color.fromRGBO(242, 194, 79, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
