import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screens/pokemon_details.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  List pokemons = [];

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  Future fetchPokemons() async {

    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=50")
    );

    final data = jsonDecode(response.body);

    setState(() {
      pokemons = data["results"];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),

      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {

          return ListTile(
            leading: Image.network(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png",

            ),
            title: Text(pokemons[index]["name"]),
            onTap: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetails(
          name: pokemons[index]["name"],
          id: index + 1,
        ),
      ),
    );

  },
);

        },
      ),
    );
  }
}