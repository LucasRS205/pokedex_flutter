import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screens/pokemon_details.dart';
import 'screens/favorites_screen.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  List <Map<String, dynamic>> pokemons = [];
  List <Map<String, dynamic>> filterPokemons = [];

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

 Future fetchPokemons() async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151"),
  );

  final data = jsonDecode(response.body);
  final results = data["results"] as List;

  List<Map<String, dynamic>> loadedPokemons = [];

  for (int i = 0; i < results.length; i++) {
    loadedPokemons.add({
      "name": results[i]["name"],
      "id": i + 1,
    });
  }

  setState(() {
    pokemons = loadedPokemons;
    filterPokemons = loadedPokemons;
  });
}
  void searchPokemon(String query) {
    final input = query.toLowerCase();

      final filtered = pokemons.where((pokemon) {
        final name = pokemon["name"].toLowerCase();
        final id = pokemon["id"].toString();

        return name.contains(input) || id.contains(input);
      }).toList();

      setState(() {
        filterPokemons = filtered;
      });
    }

  Color getTypeColor(String type) {
  switch (type) {
    case "grass":
      return Colors.green;
    case "fire":
      return Colors.orange;
    case "water":
      return Colors.blue;
    case "bug":
      return Colors.lightGreen;
    case "normal":
      return Colors.grey;
    case "poison":
      return Colors.purple;
    case "electric":
      return Colors.yellow;
    case "ground":
      return Colors.brown;
    case "fairy":
      return Colors.pinkAccent;
    case "fighting":
      return Colors.red;
    case "psychic":
      return Colors.indigo;
    case "rock":
      return Colors.brown.shade300;
    case "ghost":
      return Colors.deepPurple;
    case "ice":
      return Colors.cyan;
    case "dragon":
      return Colors.indigoAccent;
    case "flying":
      return Colors.lightBlueAccent;
    default:
      return Colors.black12;
  }
}

  BoxDecoration getPokemonCardDecoration(List types) {
  if (types.length == 1) {
    return BoxDecoration(
      color: getTypeColor(types[0]),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset(2, 4),
        ),
      ],
    );
  } else {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          getTypeColor(types[0]),
          getTypeColor(types[1]),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset(2, 4),
        ),
      ],
    );
  }
}

  Color getSimpleCardColor(int id) {
  if (id <= 3) return Colors.green.shade300;
  if (id <= 6) return Colors.orange.shade300;
  if (id <= 9) return Colors.blue.shade300;
  if (id == 25) return Colors.yellow.shade600;
  if (id == 39) return Colors.pink.shade300;
  if (id == 94) return Colors.deepPurple.shade300;
  if (id == 150 || id == 151) return Colors.indigo.shade300;
  return Colors.grey.shade400;
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex"),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
          },
        )
      ],
      ),
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
  child: filterPokemons.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: filterPokemons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) { // itemBuilder
  final pokemon = filterPokemons[index];
  final pokemonId = pokemon["id"];

  return Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: getSimpleCardColor(pokemonId),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset(2, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetails(
                name: pokemon["name"],
                id: pokemonId,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "#${pokemonId.toString().padLeft(3, '0')}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                pokemon["name"].toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Hero(
                  tag: "pokemon-$pokemonId",
                child: Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png",
                  fit: BoxFit.contain,
                  scale: 0.7
                ),
                ),
              ),
            ],
          ),
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