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
  Color getCardColor(int pokemonId) {
  if (pokemonId <= 3) {
    return Colors.green.shade200;
  } else if (pokemonId <= 6) {
    return Colors.orange.shade200;
  } else if (pokemonId <= 9) {
    return Colors.blue.shade200;
  } else if (pokemonId == 25) {
    return Colors.yellow.shade200;
  } else if (pokemonId == 39) {
    return Colors.pink.shade200;
  } else if (pokemonId == 94) {
    return Colors.deepPurple.shade200;
  } else if (pokemonId == 95) {
    return Colors.brown.shade300;
  } else if (pokemonId == 150 || pokemonId == 151) {
    return Colors.indigo.shade200;
  } else {
    return Colors.grey.shade200;
  }
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
              final pokemonId = pokemons.indexOf(filterPokemons[index]) + 1;

return Card(
  color: getCardColor(pokemonId),
  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PokemonDetails(
            name: filterPokemons[index]["name"],
            id: pokemonId,
          ),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [

          Image.network(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png",
            width: 72,
            height: 72,
          ),

          SizedBox(width: 16),

         Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        "#${pokemonId.toString().padLeft(3, '0')}",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),

      SizedBox(height: 4),

      Text(
        filterPokemons[index]["name"].toUpperCase(),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

    ],
  ),
),

          Icon(Icons.arrow_forward_ios, size: 18),

        ],
      ),
    ),
  ),
);
            },
          ),
        ),
      ]),
    );
  }
}