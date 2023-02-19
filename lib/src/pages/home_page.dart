import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';
import 'package:pokedex/src/components/cards/home_pokemon_card.dart';
import 'package:pokedex/src/models/pokemon_model.dart';
import 'package:pokedex/src/services/pokedex_service.dart';
import 'package:pokedex/utility/utility.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List<Pokemon> pokedex = [];
  @override
  void initState() {
    super.initState();
    // if (mounted) {
    //   fetchPokemonData();
    // }
    getData();
  }

  Future getData() async {
    pokedex = await PokedexService.getHomePage();
    print(pokedex.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Positioned(
            top: 80,
            left: 20,
            child: Text(
              "Pokedex",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                if (pokedex.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: pokedex.length,
                      itemBuilder: (context, index) {
                        return HomePokemonCard(
                          index: index,
                          pokemon: pokedex[index],
                        );
                      },
                    ),
                  )
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
