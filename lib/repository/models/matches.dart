import 'package:flutter_football_test/repository/models/match.dart';

class FbMatches {
  const FbMatches({required this.matches});

  final List<FbMatch> matches;

  factory FbMatches.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('null JSON provided to Matches');
    }

    return FbMatches(matches: FbMatch.listFromJson(json['matches']));
  }
}
