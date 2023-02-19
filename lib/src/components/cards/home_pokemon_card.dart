import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon_model.dart';
import 'package:pokedex/utility/utility.dart';

class HomePokemonCard extends StatelessWidget {
  final int index;
  final Pokemon pokemon;
  const HomePokemonCard({Key key, this.index, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Container(
            decoration: BoxDecoration(
              // color: Utility.getColorByType(type),
              color: Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    bottom: -10,
                    right: -10,
                    child: Image.asset(
                      'images/pokeball.png',
                      height: 100,
                      fit: BoxFit.fitHeight,
                    )),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Positioned(
                //   top: 45,
                //   left: 20,
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(20)),
                //       color: Colors.black26,
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.only(
                //           left: 8.0, right: 8.0, top: 4, bottom: 4),
                //       child: Text(
                //         type.toString(),
                //         style: const TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Hero(
                    tag: index,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )),
      ),
      onTap: () {
        //Navigate to a new screen
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => PokemonDetailScreen(
        //       pokemonDetails: pokedex[index],
        //       color: Utility.getColorByType(type),
        //       heroTag: index,
        //     ),
        //   ),
        // );
      },
    );
  }
}
