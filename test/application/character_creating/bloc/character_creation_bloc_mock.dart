import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_event.dart';
import 'package:flutter_application_1/application/character_creating/bloc/character_creation_bloc_state.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CharacterCreationBloc)
class MockCharacterCreationBloc
    extends MockBloc<CharacterCreationBlocEvent, CharacterCreationBlocState>
    implements CharacterCreationBloc {}

final bloc = MockCharacterCreationBloc();

