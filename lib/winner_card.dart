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
            child: SizedBox(
              width: _mediaquery.size.width / 1.5,
              height: _mediaquery.size.height / 2.0,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.winner!.name,
                          style: _theme.textTheme.headline3,
                        ),
                        Text(
                          '${state.winner!.venue}',
                          style: _theme.textTheme.headline4,
                        ),
                      ],
                    ),
                    if (state.winner!.crestUrl != null)
                      Image.network(state.winner!.crestUrl!),
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
