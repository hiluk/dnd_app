import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(as: CharactersRepository)
class MockCharacterRepository extends Mock implements CharactersRepository {
}
