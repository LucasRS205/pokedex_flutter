import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List> fetchPokemons() async {
    final response = await http.get(
      Uri.parse('http://pokeapi.co/api/v2/pokemon?limit=20')
      );

      if(response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results'];
      } else {
        throw Exception('Erro ao carregar Pokémon');
      
      }  
    }
}
