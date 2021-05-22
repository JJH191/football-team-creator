import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/current_team/current_team_bloc.dart';
import 'package:football/bloc/formation/formation_bloc.dart';
import 'package:football/widgets/rounded_container.dart';

class FormationDropdown extends StatelessWidget {
  final List<List<int>> formations;

  const FormationDropdown({Key? key, required this.formations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      colour: const Color(0xff71c67d),
      child: BlocBuilder<FormationBloc, FormationState>(
        builder: (context, state) {
          int index = _getIndex(state);
          if (index == -1) index = 0;
          final items = _buildDropdownList(state);
          
          return DropdownButtonHideUnderline(
            child: DropdownButton(
              value: index,
              dropdownColor: const Color(0xff333333),
              items: items,
              onChanged: (index) {
                FormationBloc formationBloc = BlocProvider.of<FormationBloc>(context);
                final team = BlocProvider.of<CurrentTeamBloc>(context).state.team;

                if (index == formations.length)
                  formationBloc.add(new SetCustomFormation(team: team)); // Last item in list selected - set to custom
                else
                  formationBloc.add(new SetFixedFormation(team: team, formation: formations[index as int], windowSize: MediaQuery.of(context).size));
              },
              iconEnabledColor: Colors.white,
              icon: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(Icons.arrow_drop_down),
              ),
            ),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownList(FormationState state) {
    List<DropdownMenuItem<int>> dropdownItems = [];
    for (int i = 0; i < formations.length; i++) {
      String formationString = _getFormationString(formations[i]);
      dropdownItems.add(_buildFormationDropdownItem(state, formationString, i));
    }

    dropdownItems.add(_buildFormationDropdownItem(state, 'CUSTOM', formations.length));
    return dropdownItems;
  }

  DropdownMenuItem<int> _buildFormationDropdownItem(FormationState state, String formationString, int index) {
    return DropdownMenuItem(
      child: Text(formationString),
      value: index,
    );
  }

  String _getFormationString(List<int> formation) {
    String formationString = '';
    for (int i = 0; i < formation.length; i++) {
      formationString += formation[i].toString();
      if (i != formation.length - 1) formationString += ' - ';
    }

    return formationString;
  }

  int _getIndex(FormationState state) {
    if (formations.length == 0) return 0;

    if (state is FormationFixed)
      return formations.indexOf(state.formation);
    else if (state is FormationCustom) return formations.length; // Custom (last item in list)
    return -1;
  }
}
