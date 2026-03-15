import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesScreen extends StatelessWidget {
  
  const FavoritesScreen({super.key});
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("favoritos").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return const Center(child: Text("Nenhum favorito encontrado.")
            );
          }

          final favoritos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: favoritos.length,
            itemBuilder: (context, index) {
  final favorito = favoritos[index];
  final data = favorito.data() as Map<String, dynamic>;
  final nome = favorito["pokemon"];
  final pokemonId = data["id"];


  return ListTile(
    leading: pokemonId != null
        ? Image.network(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png",
            width: 50,
          )
        : const Icon(Icons.favorite, color: Colors.red),
    title: Text(
      nome.toUpperCase(),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    trailing: IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        FirebaseFirestore.instance
            .collection("favoritos")
            .doc(favorito.id)
            .delete();
      },
    ),
  );
},
          );
        },
      ),
    );
  }
}