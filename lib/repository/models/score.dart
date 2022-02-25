import 'package:flutter/foundation.dart';
import 'package:flutter_football_test/repository/models/team_type.dart';
import 'package:flutter_football_test/utils/evalutate_team_type.dart';

class Score {
  const Score({required this.winner});

  final TeamType winner;

  factory Score.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('null JSON provided to Score');
    }

    return Score(
      winner: evalutateTeamType(json['winner']),
    );
  }
}
