// TODO(Brydie): Flesh out with properties to display in the app.
class Team {
  const Team({
    required this.id,
    required this.name,
    this.crestUrl,
    this.venue,
  });

  final int id;
  final String name;
  final String? crestUrl;
  final String? venue;

  factory Team.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('null JSON provided to Team');
    }

    return Team(
      id: json['id'],
      name: json['name'],
      crestUrl: json['crestUrl'],
      venue: json['venue'],
    );
  }
}
