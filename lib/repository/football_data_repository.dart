import 'package:flutter_football_test/repository/models/matches.dart';
import 'package:flutter_football_test/repository/models/team.dart';
import 'package:flutter_football_test/repository/service/football_data_service.dart';

class FootballDataRepository {
  const FootballDataRepository({
    required this.service,
  });

  final FootballDataService service;

  Future<FbMatches> getMatches() async => service.getMatches();
  Future<Team> getTeam(int id) async => service.getTeam(id);
}
