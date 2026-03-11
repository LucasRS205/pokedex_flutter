import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final db = FirebaseFirestore.instance;

  void salvarFavorito(String nome) {
    db.collection("favoritos").add({"pokemon": nome});
  }
}