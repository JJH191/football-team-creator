import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/formation/formation_bloc.dart';
import 'package:football/bloc/selected_player/selected_player_bloc.dart';
import 'package:football/data/moor_database.dart';
import 'package:football/pages/player_selector.dart';
import 'package:football/utils/navigation.dart';
import 'package:football/widgets/player_list_item.dart';

class TeamEditor extends StatelessWidget {
  TeamEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormationBloc, FormationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _buildTeam(context, state, 1)),
                    VerticalDivider(width: 0, endIndent: 10, indent: 10),
                    Expanded(child: _buildTeam(context, state, 2)),
                  ],
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      final Object? newPlayers = await Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (_) => PlayerSelector(
                            multiselect: true,
                            initialPlayers: state.players.map((player) => player.player).toList(),
                          ),
                        ),
                      );

                      final bloc = BlocProvider.of<FormationBloc>(context, listen: false);
                      if (newPlayers is List<EditablePlayer>) {
                        bloc.add(ShufflePlayers(players: newPlayers.map<Player>((p) => p.toPlayer() as Player).toList()));
                      } else if (newPlayers is EditablePlayer) {
                        bloc.add(ShufflePlayers(players: [newPlayers.toPlayer() as Player]));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('SELECT PLAYERS'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<FormationBloc>(context, listen: false).add(ShufflePlayers());
                      //_shuffleTeams(state, context, state.players);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('SHUFFLE TEAMS'),
                    ),
                  ),
                  Expanded(child: Container()),
                  TextButton(onPressed: () => Navigation.pop(context), child: Text('DONE')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTeam(BuildContext context, FormationState state, int teamNumber) {
    final players = state.players.where((player) => player.position.team == teamNumber);

    return DragTarget<PlayerWithPosition>(
      onAccept: (player) {
        if (teamNumber != player.position.team)
          BlocProvider.of<FormationBloc>(context).add(
            ChangePlayerTeam(playerPosition: player.position),
          );
      },
      builder: (context, _, __) => Column(
        children: [
          Text('Team ${teamNumber.toString()}'),
          Expanded(
            child: ListView(
              children: players.map(
                (player) {
                  final listItem = PlayerListItem(
                    player: player.player,
                    onTap: (_) async {
                      Object? newPlayer = await Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) => PlayerSelector(
                            multiselect: false,
                            initialPlayers: [player.player],
                          ),
                        ),
                      );

                      if (newPlayer is EditablePlayer)
                        BlocProvider.of<FormationBloc>(context).add(SwapPlayer(oldPlayer: player, newPlayer: newPlayer.toPlayer() as Player));
                    },
                  );

                  return Draggable<PlayerWithPosition>(
                    childWhenDragging: Container(),
                    feedback: Material(child: listItem, type: MaterialType.transparency),
                    child: listItem,
                    data: player,
                  );
                },
              ).toList(),
            ),
          ),
          Text('Score: ${players.length == 0 ? 0 : players.map((player) => player.player.score).reduce((a, b) => a + b)}'),
        ],
      ),
    );
  }
}
