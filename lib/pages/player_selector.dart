import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/current_player/current_player_bloc.dart';
import 'package:football/data/moor_database.dart';
import 'package:football/utils/navigation.dart';
import 'package:football/widgets/player_editor.dart';
import 'package:football/widgets/player_searcher.dart';

class PlayerSelector extends StatelessWidget {
  final bool multiselect;
  final Player? initialPlayer;
  late CurrentPlayerBloc bloc;

  PlayerSelector({Key? key, required this.multiselect, this.initialPlayer}) : super(key: key) {
    bloc = CurrentPlayerBloc(initialPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: BlocProvider(
        create: (_) => bloc,
        child: Row(
          children: [
            Flexible(
              child: PlayerSearcher(
                onSelect: () {
                  final state = bloc.state;
                  if (state is PlayerSelectedState) 
                    Navigator.of(context).pop(state.player);
                  else Navigation.pop(context);
                },
                onCancel: () => Navigation.pop(context),
                multiselect: multiselect,
              ),
              flex: 7,
            ),
            VerticalDivider(width: 0, endIndent: 10, indent: 10),
            Flexible(child: PlayerEditor(), flex: 5),
          ],
        ),
      ),
    );
  }
}
