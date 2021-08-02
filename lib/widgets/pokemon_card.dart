// Image // string
// Name // string
// Pokemon Type // array of string

import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> types;
  const PokemonCard(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              child: Image.network(imageUrl),
            ),
            SizedBox(width: 16),
            Column(
              children: [
                Text("$title"),
                Row(
                  children: types.map((x) => Text('$x')).toList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
