import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_test/bloc/winner_bloc.dart';
import 'package:flutter_football_test/error_with_refresh.dart';

class WinnerCard extends StatelessWidget {
  const WinnerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mediaquery = MediaQuery.of(context);

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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.winner!.name,
                          style: _theme.textTheme.headline4,
                        ),
                        Text(
                          '${state.winner!.venue}',
                          style: _theme.textTheme.headline5,
                        ),
                      ],
                    ),
                    if (state.winner!.crestUrl != null)
                      Image.network(
                        state.winner!.crestUrl!,
                        width: _mediaquery.size.width / 3.5,
                      ),
                  ],
                ),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
