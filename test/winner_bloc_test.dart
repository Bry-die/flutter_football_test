import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_football_test/bloc/winner_bloc.dart';
import 'package:flutter_football_test/repository/football_data_repository.dart';
import 'package:flutter_football_test/repository/models/match.dart';
import 'package:flutter_football_test/repository/models/matches.dart';
import 'package:flutter_football_test/repository/models/score.dart';
import 'package:flutter_football_test/repository/models/team.dart';
import 'package:flutter_football_test/repository/models/team_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'winner_bloc_test.mocks.dart';

class MockWinnerBloc extends MockBloc<WinnerEvent, WinnerState>
    implements WinnerBloc {}

@GenerateMocks([FbMatches, Team, FootballDataRepository])
void main() {
  group('WinnerBloc', () {
    late MockFootballDataRepository repository;

    const Team team = Team(
      id: 123,
      name: 'Test team',
    );

    setUp(() {
      repository = MockFootballDataRepository();
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => WinnerBloc(footballDataRepository: repository),
      expect: () => [],
    );

    blocTest(
      'emits [WinnerState, WinnerState] when GetWinner event is added',
      setUp: () {
        when(repository.getMatches()).thenAnswer(
          (_) async => MockFbMatches(),
        );

        when(repository.getTeam(1)).thenAnswer((_) async => team);
      },
      build: () => WinnerBloc(
        footballDataRepository: repository,
      ),
      act: (WinnerBloc bloc) => bloc.add(GetWinner()),
      expect: () => [isA<WinnerState>(), isA<WinnerState>()],
    );

    const Team winner = Team(id: 2, name: 'b');
    blocTest(
      'successful response from GetWinner event returns correct state',
      setUp: () {
        when(repository.getMatches()).thenAnswer(
          (_) async => const FbMatches(
            matches: <FbMatch>[
              FbMatch(
                awayTeam: Team(id: 1, name: 'a'),
                homeTeam: winner,
                score: Score(winner: TeamType.HOME_TEAM),
              ),
            ],
          ),
        );

        when(repository.getTeam(2)).thenAnswer((_) async => winner);
      },
      build: () => WinnerBloc(
        footballDataRepository: repository,
      ),
      act: (WinnerBloc bloc) => bloc.add(GetWinner()),
      expect: () => [
        const WinnerState(status: WinnerStatus.loading, winner: null),
        const WinnerState(status: WinnerStatus.success, winner: winner),
      ],
    );

    blocTest(
      'error response from GetWinner() event returns correct state',
      setUp: () {
        when(repository.getMatches()).thenThrow(Exception());
      },
      build: () => WinnerBloc(
        footballDataRepository: repository,
      ),
      act: (WinnerBloc bloc) => bloc.add(GetWinner()),
      expect: () => [
        const WinnerState(status: WinnerStatus.loading, winner: null),
        const WinnerState(status: WinnerStatus.error, winner: null),
      ],
    );
  });
}
