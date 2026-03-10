import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {

  final String name;
  final int id;

  PokemonDetails({required this.name, required this.id});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text(name)),

      body: Center(
        child: Column()
      )
    )
  }

}