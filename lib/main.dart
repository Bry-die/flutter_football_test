import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_test/bloc/winner_bloc.dart';
import 'package:flutter_football_test/config/api_config.dart';
import 'package:flutter_football_test/repository/football_data_repository.dart';
import 'package:flutter_football_test/repository/service/football_data_service.dart';
import 'package:flutter_football_test/utils/app_bloc_observer.dart';
import 'package:flutter_football_test/winner_card.dart';

void main() async {
  // Development
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Football Test',
      home: RepositoryProvider(
        create: (context) => FootballDataRepository(
          service: FootballDataService(apiKey: apiKey),
        ),
        child: BlocProvider(
          create: (context) => WinnerBloc(
            footballDataRepository: context.read<FootballDataRepository>(),
          )..add(GetWinner()),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('And the winner is...'),
            ),
            backgroundColor: const Color.fromARGB(255, 238, 238, 238),
            body: const WinnerCard(),
          ),
        ),
      ),
    );
  }
}
