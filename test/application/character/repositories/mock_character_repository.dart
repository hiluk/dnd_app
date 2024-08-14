import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CharactersRepository)
class MockCharacterRepository extends CharactersRepository {
  MockCharacterRepository(super.httpClient);
}
