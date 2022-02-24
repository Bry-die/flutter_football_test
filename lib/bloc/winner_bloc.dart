import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_test/repository/football_data_repository.dart';
import 'package:flutter_football_test/repository/models/match.dart';
import 'package:flutter_football_test/repository/models/team.dart';
import 'package:flutter_football_test/utils/find_winner.dart';

part 'winner_event.dart';
part 'winner_state.dart';

class WinnerBloc extends Bloc<WinnerEvent, WinnerState> {
  WinnerBloc({
    required this.footballDataRepository,
  }) : super(const WinnerState()) {
    on<GetWinner>(_mapGetCategoriesEventToState);
  }

  final FootballDataRepository footballDataRepository;

  void _mapGetCategoriesEventToState(
    GetWinner event,
    Emitter<WinnerState> emit,
  ) async {
    emit(state.copyWith(status: WinnerStatus.loading));
    try {
      final matches = await footballDataRepository.getMatches();
      final winnerId = findWinner(matches.matches);

      try {
        final winner = await footballDataRepository.getTeam(winnerId);

        emit(state.copyWith(
          status: WinnerStatus.success,
          winner: winner,
        ));
      } catch (e) {
        emit(state.copyWith(status: WinnerStatus.error));
      }
    } catch (error, _) {
      emit(state.copyWith(status: WinnerStatus.error));
    }
  }
}
