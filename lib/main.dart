import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  final ApiService api = ApiService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Pokédex")),

        body: FutureBuilder(
          future: api.fetchPokemons(),

          builder: (context, snapshot){

            if(snapshot.hasData){
              List pokemons = snapshot.data as List;

              return ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                      width: 50,
                    ),
                    title: Text(pokemons[index]['name']),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}