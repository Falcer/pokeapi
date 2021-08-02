import 'package:get/get.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/services/pokemon_service.dart';

class HomeController extends GetxController {
  var pokemons = <Pokemon>[].obs;
  HomeController() {
    getPokemonPage(0);
  }

  void getPokemonPage(int page) {
    PokemonService.getPokemonPage(0).then((value) {
      pokemons.value = value;
      update();
    });
  }
}
