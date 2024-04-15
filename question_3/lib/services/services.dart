import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:question_3/models/character_model.dart';

class CharacterService {
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  Future<Character> fetchCharacters(int currentPage) async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );
    if (response.statusCode == 200) {
      return Character.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(
        'Failed to load characters',
      );
    }
  }
}
