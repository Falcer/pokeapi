class Pokemon {
  final String name;
  final String imageUrl;
  final List<Type> types;

  Pokemon(this.name, this.imageUrl, this.types);

  factory Pokemon.fromJSON(Map<String, dynamic> json) {
    return Pokemon(json['name'], json['sprites']['front_default'], []
        // json['types'].forEach(
        //   (x) {
        //     types.add(Type(
        //       x['type']['name'],
        //     ));
        //   },
        );
  }
}

class Type {
  final String name;

  Type(this.name);
}
