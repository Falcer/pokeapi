import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/controllers/home_controller.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/widgets/pokemon_card.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: controller,
        builder: (_) => RefreshIndicator(
          onRefresh: () async {
            _.getPokemonPage(0);
          },
          child: _.pokemons.length < 1
              ? Container(
                  child: Stack(
                    children: [
                      ListView(),
                      Center(
                        child: Text("Empty Pokemon"),
                      ),
                    ],
                  ),
                )
              : list(context, _.pokemons),
        ),
      ),
    );
  }

  Widget list(BuildContext context, List<Pokemon> pokemons) {
    return ListView.separated(
      separatorBuilder: (ctx, idx) {
        return SizedBox(
          height: 16,
        );
      },
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        return PokemonCard(
          title: "${pokemons[idx].name}",
          imageUrl: "${pokemons[idx].imageUrl}",
          types: ["$idx"],
        );
      },
      itemCount: pokemons.length,
    );
  }
}
