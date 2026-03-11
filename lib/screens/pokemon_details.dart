import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class PokemonDetails extends StatelessWidget {

  final String name;
  final int id;

  final firebase = FirebaseService();

  PokemonDetails({required this.name, required this.id});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text(name)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
              width: 150,
            ),

            SizedBox(height: 20),

            Text(
              name.toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                firebase.salvarFavorito(name);
              },
              child: Text("Salvar favorito"),
            ),

          ],
        ),
      ),
    );
  }
}