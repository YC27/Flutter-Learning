class Channel {
  final int id;
  final String name;

  Channel({required this.id, required this.name});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json["id"],
      name: json["name"],
    );
  }
}
