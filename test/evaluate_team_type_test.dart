import 'package:flutter_football_test/repository/models/team_type.dart';
import 'package:flutter_football_test/utils/evalutate_team_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('evaluateTeamType ', () {
    test('returns TeamType.DRAW if passed null', () {
      final result = evalutateTeamType(null);

      expect(result.runtimeType, TeamType);
      expect(result, TeamType.DRAW);
    });

    test('returns TeamType.DRAW if passed DRAW', () {
      final result = evalutateTeamType('DRAW');

      expect(result, TeamType.DRAW);
    });

    test('returns the TeamType.HOME_TEAM when passed HOME_TEAM', () {
      final result = evalutateTeamType('HOME_TEAM');

      expect(result, TeamType.HOME_TEAM);
    });

    test('returns the TeamType.AWAY_TEAM when passed AWAY_TEAM', () {
      final result = evalutateTeamType('AWAY_TEAM');

      expect(result, TeamType.AWAY_TEAM);
    });
  });
}
