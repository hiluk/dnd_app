// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/core/api/races/models/race_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/core/utils/interfaces/i_repository.dart';

class RacesRepository implements IRepository {
  @override
  final IHttpClient httpClient;

  const RacesRepository(this.httpClient);

  @override
  Future<List<Race>> fetch() async {
    final data = await httpClient.get('/races');

    return (data as List)
        .map(
          (raceJson) => Race.fromJson(raceJson),
        )
        .toList();
  }
}
