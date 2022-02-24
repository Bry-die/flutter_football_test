import 'package:dio/dio.dart';
import 'package:flutter_football_test/repository/models/matches.dart';
import 'package:flutter_football_test/repository/models/team.dart';
import 'package:intl/intl.dart';

class FootballDataService {
  FootballDataService({
    required this.apiKey,
    this.baseUrl = 'https://api.football-data.org/v2',
  });

  final String apiKey;
  final String baseUrl;

  /// Normally would initialise a Http singleton which contains all the default
  /// options for requests to this specific api, such as default headers and
  /// query params. But as these are the only required api request have opted
  /// to pass them manually.
  Future<FbMatches> getMatches() async {
    final dateTo = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final dateFrom = DateFormat('yyyy-MM-dd').format(
      DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch -
            (Duration.millisecondsPerDay * 30),
      ),
    );

    try {
      final Response<dynamic> response = await Dio().get(
        '$baseUrl/competitions/PL/matches',
        options: Options(
          headers: <String, dynamic>{'X-Auth-Token': apiKey},
        ),
        queryParameters: <String, dynamic>{
          'dateTo': dateTo,
          'dateFrom': dateFrom,
        },
      );

      return FbMatches.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Team> getTeam(int id) async {
    try {
      final Response<dynamic> response = await Dio().get(
        '$baseUrl/teams/$id',
        options: Options(
          headers: <String, dynamic>{'X-Auth-Token': apiKey},
        ),
      );

      return Team.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
