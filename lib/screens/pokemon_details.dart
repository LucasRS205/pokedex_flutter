import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonDetails extends StatefulWidget {

  final String name;
  final int id;

  const PokemonDetails({super.key, required this.name, required this.id});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {

  final firebase = FirebaseService();

  String description = "";
  List<String> types = [];
  double height = 0;
  double weight = 0;

  int hp = 0;
  int attack = 0;
  int defense = 0;
  int speed = 0;


  @override
  void initState() {
    super.initState();
    FetchDescription();
    fetchPokemonData();
  }

  Future FetchDescription() async {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon-species/${widget.id}/")
    );

    final data = jsonDecode(response.body);

  
    final entries = data["flavor_text_entries"];

    for (var entry in entries){
      if (entry["language"]["name"] == "pt-br"){
        setState(() {
          description = entry["flavor_text"]
              .replaceAll("\n", " ")
              .replaceAll("\f", " ");
        });
        return;
      }
    }
    for (var entry in entries){
      if (entry["language"]["name"] == "en"){
        setState(() {
          description = entry["flavor_text"]
              .replaceAll("\n", " ")
              .replaceAll("\f", " ");
        });
        return;
      }
    }
  }
   Color getPokemonColor(){
    String mainType = types.isNotEmpty ? types[0] : "";
    switch (mainType) {
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
        return const Color.fromARGB(255, 251, 116, 217);
      case "rock":
        return Colors.brown[300]!;
      case "ghost":
        return Colors.deepPurple;
      case "ice":
        return Colors.cyanAccent;
      case "dragon":
        return Colors.indigoAccent;
      default:
        return Colors.black;
    }
   }

   Color getTypeColor(String typeName) {
  switch (typeName) {
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
      return Colors.amber;
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
    default:
      return Colors.black54;
  }
}
Widget _buildStat(String name, int value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$name: $value",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: value / 200,
          minHeight: 8,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      backgroundColor: getPokemonColor(),

      body: SingleChildScrollView(
  child: Column(
    children: [

      SizedBox(height: 20),

      Text(
        "#${widget.id.toString().padLeft(3, '0')}",
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      Text(
        widget.name.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 20),

      Image.network(
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png",
        height: 220,
      ),

      const SizedBox(height: 20),

      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: types.map((typeName) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: getTypeColor(typeName),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    typeName.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    const Text(
                      "Altura",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${height} m",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    const Text(
                      "Peso",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${weight} kg",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ],
            ),

            const SizedBox(height: 24),

            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Status",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 12),

            _buildStat("HP", hp),
            _buildStat("Attack", attack),
            _buildStat("Defense", defense),
            _buildStat("Speed", speed),

            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                firebase.salvarFavorito(widget.name);
              },
              icon: const Icon(Icons.favorite),
              label: const Text("Salvar favorito"),
            ),

          ],
        ),
      ),

    ],
  ),
),
    );
  }
 Future fetchPokemonData() async {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/${widget.id}/")
    );

    final data = jsonDecode(response.body);

    setState(() {
  types = (data["types"] as List)
      .map((item) => item["type"]["name"] as String)
      .toList();

  height = data["height"] / 10;
  weight = data["weight"] / 10;

  hp = data["stats"][0]["base_stat"];
  attack = data["stats"][1]["base_stat"];
  defense = data["stats"][2]["base_stat"];
  speed = data["stats"][5]["base_stat"];
});
  }
}