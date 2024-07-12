class Pokemon {
  final int id;
  final String name;
  final String url;
  final List<dynamic>? types;
  final int? height;
  final int? weight;
  final List<dynamic>? abilities;
  final List<dynamic>? stats;
  final dynamic sprites;

  Pokemon(
      {required this.id,
      required this.name,
      required this.url,
      this.types,
      this.height,
      this.weight,
      this.abilities,
      this.stats,
      this.sprites});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        name: json['name'],
        url: json['name'],
        types: json['types'],
        height: json['height'],
        weight: json['weight'],
        abilities: json['abilities'],
        stats: json['stats'],
        sprites: json['sprites']);
  }

  factory Pokemon.fromJsonSimple(Map<String, dynamic> json) {
    return Pokemon(
      id: json['entry_number'],
      name: json['pokemon_species']['name'],
      url: json['pokemon_species']['url'],
    );
  }

  
}
