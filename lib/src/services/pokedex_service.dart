import 'dart:convert';

import 'package:pokedex/src/models/pokemon_model.dart';

import 'package:http/http.dart' as http;

class PokedexService {
  static Future<List<Pokemon>> getHomePage() async {
    List<Pokemon> pokemons = [];
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) as Map<String, dynamic>;
      pokemons = (jsonData['pokemon'] as List)
          .map((i) => Pokemon.fromJson(i))
          .toList();
    }
    return pokemons;
  }
}
