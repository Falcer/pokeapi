import 'package:pokeapi/models/pokemon.dart';
import 'package:dio/dio.dart';

const MAX_PAGE = 20;

// n+1
// 20+1 // http get 21

class PokemonService {
  static Future<List<Pokemon>> getPokemonPage(int page) async {
    List<Pokemon> pokemons = [];
    try {
      var response = await Dio().get(
          'https://pokeapi.co/api/v2/pokemon/?offset=${page * MAX_PAGE}&limit=$MAX_PAGE');
      response.data['results'].forEach((x) async {
        var res = await Dio().get(x['url']);
        var data = Pokemon.fromJSON(res.data);
        pokemons.add(data);
      });
      return pokemons;
    } catch (e) {
      throw e;
    }
  }
}
