import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final db = FirebaseFirestore.instance;

  Future<void> salvarFavorito(String nome, int id) async {
    await db.collection("favoritos").doc(id.toString()).set({
      "pokemon": nome,
      "id": id,
    });
  }
}