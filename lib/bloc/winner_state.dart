part of 'winner_bloc.dart';

enum WinnerStatus { initial, success, error, loading }

extension WinnerStatusX on WinnerStatus {
  bool get isInitial => this == WinnerStatus.initial;
  bool get isSuccess => this == WinnerStatus.success;
  bool get isError => this == WinnerStatus.error;
  bool get isLoading => this == WinnerStatus.loading;
}

class WinnerState extends Equatable {
  const WinnerState({
    this.status = WinnerStatus.initial,
    this.winner,
  });

  final Team? winner;
  final WinnerStatus status;

  @override
  List<Object?> get props => [status, winner];

  WinnerState copyWith({
    Team? winner,
    WinnerStatus? status,
  }) {
    return WinnerState(
      winner: winner ?? this.winner,
      status: status ?? this.status,
    );
  }
}
