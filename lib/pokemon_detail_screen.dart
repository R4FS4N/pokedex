import 'dart:wasm';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetails;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen({Key key, this.pokemonDetails, this.color, this.heroTag}) : super(key: key);
  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 30), onPressed: (){
              Navigator.pop(context);
            }),
          ),
          Positioned(
              top: 90,
              left: 20,
              child: Text(widget.pokemonDetails['name'],style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                ),
              )
          ),

          Positioned(
              top: 140,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black26
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Text(widget.pokemonDetails['type'].join(', '), style: TextStyle(
                    color: Colors.white
                   )
                  )
                )
              )
          ),

          Positioned(
              top: height * 0.18,
              right: -30,
              child: Image.asset('images/pokeball.png', height: 200, fit: BoxFit.fitHeight,)
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)
                ),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Name', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            Container(
                              child: Text(widget.pokemonDetails['name'], style: TextStyle(
                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Height', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            Container(
                              child: Text(widget.pokemonDetails['height'], style: TextStyle(
                                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Weight', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            Container(
                              child: Text(widget.pokemonDetails['weight'], style: TextStyle(
                                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Spawn Time', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            Container(
                              child: Text(widget.pokemonDetails['spawn_time'], style: TextStyle(
                                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Weakness', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            Container(
                              child: Text(widget.pokemonDetails['weaknesses'], style: TextStyle(
                                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Prev Form', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            widget.pokemonDetails['prev_evolution'] != null ?
                            SizedBox(
                                height: 20,
                                width: width * 0.55,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.pokemonDetails['prev_evolution'].length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(widget.pokemonDetails['prev_evolution'][index]['name'], style: TextStyle(
                                          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                                      )
                                      ),
                                    );
                                  },
                                )
                            ) : Text('Just Hatched', style: TextStyle
                              (
                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                            )
                            )
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Container(
                              width: width * 0.3,
                              child: Text('Evolution', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18,
                              ),
                              ),
                            ),
                            widget.pokemonDetails['next_evolution'] != null ?
                            SizedBox(
                              height: 20,
                              width: width * 0.55,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemonDetails['next_evolution'].length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(widget.pokemonDetails['next_evolution'][index]['name'], style: TextStyle(
                                        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                                    )
                                    ),
                                  );
                                },
                              )
                            ) : Text('Maxed Out', style: TextStyle
                              (
                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                            )
                            )
                          ]
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
          Positioned(
              top: height * 0.18,
              left: (width / 2) - 100,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.pokemonDetails,
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              )
          )
        ],
      ),
    );
  }
}
