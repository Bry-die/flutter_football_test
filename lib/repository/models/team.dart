// TODO(Brydie): Flesh out with properties to display in the app.
class Team {
  const Team({
    required this.id,
  });

  final int id;

  factory Team.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('null JSON provided to Team');
    }

    return Team(id: json['id']);
  }
}
