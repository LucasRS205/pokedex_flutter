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
              return ListTile(
                leading: const Icon(Icons.favorite, color: Colors.red),
                title: Text(favorito["pokemon"]),
              );
            },
          );
        },
      ),
    );
  }
}