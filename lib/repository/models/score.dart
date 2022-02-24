import 'package:flutter/foundation.dart';
import 'package:flutter_football_test/repository/models/team_type.dart';

class Score {
  const Score({required this.winner});

  final TeamType winner;

  factory Score.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('null JSON provided to Score');
    }

    return Score(
      // TODO(Brydie): Split this into it's own util function.
      winner: json['winner'] != null
          ? TeamType.values.firstWhere(
              (e) => describeEnum(e) == json['winner'],
            )
          : TeamType.DRAW,
    );
  }
}
