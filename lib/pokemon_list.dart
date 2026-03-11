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
  List filterPokemons = [];

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  Future fetchPokemons() async {

    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151")
    );

    final data = jsonDecode(response.body);

    setState(() {
      pokemons = data["results"];
      filterPokemons = pokemons;
    });
    
  }
  void searchPokemon(String query) {
      final filtered = pokemons.where((pokemon) {
        final name = pokemon["name"].toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();

      setState(() {
        filterPokemons = filtered;
      });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: searchPokemon,
            decoration: const InputDecoration(
              labelText: "Pesquisar Pokemon",
              border: OutlineInputBorder(),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: filterPokemons.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemons.indexOf(filterPokemons[index]) + 1}.png",
                ),
                title: Text(filterPokemons[index]["name"]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetails(
                        name: filterPokemons[index]["name"],
                        id: pokemons.indexOf(filterPokemons[index]) + 1,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}