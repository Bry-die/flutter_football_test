import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_test/bloc/winner_bloc.dart';
import 'package:flutter_football_test/error_with_refresh.dart';

class WinnerCard extends StatelessWidget {
  const WinnerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WinnerBloc, WinnerState>(
      builder: (
        BuildContext context,
        WinnerState state,
      ) {
        if (state.status.isError) {
          return Center(
            child: ErrorRefresh(
              onPressed: () => context.read<WinnerBloc>().add(GetWinner()),
              errorText: 'Unable to fetch posts, please try again.',
            ),
          );
        }

        if (state.status.isSuccess) {
          return Center(
              child: Card(
            child: Row(
              children: [
                Text('${state.winner!.id}'),
                // TODO(Brydie): Add team data.
              ],
            ),
          ));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
