import 'package:flutter/foundation.dart';
import 'package:flutter_football_test/repository/models/team_type.dart';

TeamType evalutateTeamType(dynamic typeJson) => typeJson != null
    ? TeamType.values.firstWhere((e) => describeEnum(e) == typeJson)
    : TeamType.DRAW;
