import 'package:flutter_application_1/core/api/weapons/models/weapon_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class WeaponsRepository {
  final IHttpClient httpClient;

  const WeaponsRepository(this.httpClient);

  Future<List<Weapon>> fetch() async {
    final data = await httpClient.get('weapons');
    final weaponsRawList = data["results"] as List<dynamic>;

    return weaponsRawList
        .map(
          (json) => Weapon.fromJson(json),
        )
        .toList();
  }
}
