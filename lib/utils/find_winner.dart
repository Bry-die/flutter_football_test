import 'dart:math';

import 'package:flutter_football_test/repository/models/match.dart';
import 'package:flutter_football_test/repository/models/team_type.dart';

int findWinner(List<FbMatch> matches) {
  final Map<int, int> tally = matches.fold(
    <int, int>{},
    (Map<int, int> prev, FbMatch match) {
      final int winnerId = match.score.winner == TeamType.AWAY_TEAM
          ? match.awayTeam.id
          : match.homeTeam.id;

      prev.containsKey(winnerId) ? prev[winnerId]! + 1 : prev[winnerId] = 1;

      return prev;
    },
  );

  // Flaw in the logic regarding a draw in number of wins.
  final int maxScoreIndex = tally.values.toList().indexOf(
        tally.values.reduce(max),
      );

  return tally.keys.toList()[maxScoreIndex];
}
