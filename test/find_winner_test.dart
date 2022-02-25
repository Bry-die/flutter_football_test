import 'package:flutter_football_test/bloc/winner_bloc.dart';
import 'package:flutter_football_test/repository/models/match.dart';
import 'package:flutter_football_test/repository/models/score.dart';
import 'package:flutter_football_test/repository/models/team.dart';
import 'package:flutter_football_test/repository/models/team_type.dart';
import 'package:flutter_football_test/utils/find_winner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('findWinner ', () {
    test('returns an id for a team', () {
      final matches = <FbMatch>[
        const FbMatch(
          awayTeam: Team(id: 1, name: ''),
          homeTeam: Team(id: 1, name: ''),
          score: Score(winner: TeamType.AWAY_TEAM),
        ),
      ];

      final result = findWinner(matches);

      expect(result.runtimeType, int);
      expect(result, 1);
    });

    test('returns the Team with most wins', () {
      const winningTeam = Team(id: 1, name: 'winner');
      const losingTeam = Team(id: 2, name: 'loser');

      final matches = <FbMatch>[
        const FbMatch(
          awayTeam: winningTeam,
          homeTeam: losingTeam,
          score: Score(winner: TeamType.AWAY_TEAM),
        ),
        const FbMatch(
          awayTeam: losingTeam,
          homeTeam: winningTeam,
          score: Score(winner: TeamType.HOME_TEAM),
        ),
        const FbMatch(
          awayTeam: winningTeam,
          homeTeam: losingTeam,
          score: Score(winner: TeamType.DRAW),
        ),
      ];

      final result = findWinner(matches);

      expect(result, 1);
    });
  });
}
