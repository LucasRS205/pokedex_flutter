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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      backgroundColor: getPokemonColor(),

      body: Center(
        child: Column(
          
          children: [

            Image.network(
  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png',
  width: 200,
),

            Text(
              widget.name.toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            SizedBox(height: 10),

           Wrap(
  spacing: 8,
  children: types.map((typeName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: getTypeColor(typeName),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        typeName.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }).toList(),
),

SizedBox(height: 10),

Text(
  "Altura: ${height} m",
  style: TextStyle(color: Colors.white),
),

Text(
  "Peso: ${weight} kg",
  style: TextStyle(color: Colors.white),
),

            ElevatedButton(
              onPressed: () {
                firebase.salvarFavorito(widget.name);
              },
              child: Text("Salvar favorito"),
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
});
  }
}