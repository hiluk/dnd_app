import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/character/models/attributes_model.dart';
import 'package:flutter_application_1/application/character_creating/bloc/attributes_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/class_cubit.dart';
import 'package:flutter_application_1/application/character_creating/bloc/race_cubit.dart';
import 'package:flutter_application_1/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/showing_fab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerFAB extends StatefulWidget {
  const BlocListenerFAB({super.key});

  @override
  State<BlocListenerFAB> createState() => _BlocListenerFABState();
}

class _BlocListenerFABState extends State<BlocListenerFAB> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    void clearVariables() {
      context.read<RaceCubit>().selectRace(null);
      context.read<ClassCubit>().selectClass(null);
      context.read<StatsCubit>().dispose();
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ClassCubit, Class?>(
          listener: _stateToggle,
        ),
        BlocListener<RaceCubit, Race?>(
          listener: _stateToggle,
        ),
        BlocListener<StatsCubit, Attributes?>(
          listener: _stateToggle,
        ),
      ],
      child: OpacityFAB(
        title: 'Выбрать',
        isShow: isShow,
        onTap: () {
          final bloc = context.read<CharacterCreationBloc>();
          bloc.add(
            CharacterCreationBlocEventSelect(
              previousState: bloc.state,
              characterRace: context.read<RaceCubit>().state,
              characterClass: context.read<ClassCubit>().state,
              characterStats: context.read<StatsCubit>().state,
            ),
          );
          clearVariables();
        },
      ),
    );
  }

  void _stateToggle(BuildContext context, Object? state) {
    state != null
        ? setState(() => isShow = true)
        : setState(() => isShow = false);
  }
}
