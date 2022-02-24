import 'package:flutter_football_test/repository/models/score.dart';
import 'package:flutter_football_test/repository/models/team.dart';

class FbMatch {
  const FbMatch({
    required this.awayTeam,
    required this.homeTeam,
    required this.score,
  });

  final Team awayTeam;
  final Team homeTeam;
  final Score score;

  factory FbMatch.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('null JSON provided to FbMatch');
    }

    return FbMatch(
      awayTeam: Team.fromJson(json['awayTeam']),
      homeTeam: Team.fromJson(json['homeTeam']),
      score: Score.fromJson(json['score']),
    );
  }

  static List<FbMatch> listFromJson(List<dynamic>? json) {
    return json == null
        ? <FbMatch>[]
        : json.map<FbMatch>((value) => FbMatch.fromJson(value)).toList();
  }
}
