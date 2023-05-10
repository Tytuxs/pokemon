import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

import 'constants.dart';
import 'customCard.dart';

class AllPokemonTab extends StatefulWidget {
  const AllPokemonTab({Key? key}) : super(key: key);

  @override
  State<AllPokemonTab> createState() => _AllPokemonTabState();
}

class _AllPokemonTabState extends State<AllPokemonTab> {
  List<Pokemon?> liste = [];

  /*void getPokemon() {
    var reponse = PokeAPI.getObjectList<Pokemon>(1,20);
    reponse.then((value) {
      value.forEach((element) {
        print(element);
        liste.add(element);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPokemon();
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'test1',
          height: heightImage,
          image: Image.asset('images/Bulbizarre.png', width: 100, fit: BoxFit.contain),
          onTab: () { },
          color: Color.fromRGBO(160, 255, 100, 1.0),
          gradient: Color.fromRGBO(50, 255, 50, 1.0),
        ),
        CustomCard(
          title: 'test1',
          height: heightImage,
          image: Image.asset('images/Bulbizarre.png', width: 100, fit: BoxFit.contain),
          onTab: () { },
          color: Color.fromRGBO(108, 115, 255, 1),
          gradient: Color.fromRGBO(58, 63, 255, 1),
        ),
        CustomCard(
          title: 'test1',
          height: heightImage,
          image: Image.asset('images/Bulbizarre.png', width: 100, fit: BoxFit.contain),
          onTab: () { },
          color: Color.fromRGBO(108, 115, 255, 1),
          gradient: Color.fromRGBO(58, 63, 255, 1),
        ),
      ],
    );
  }
}