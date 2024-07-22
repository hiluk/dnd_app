import 'package:flutter_application_1/core/api/weapons/models/weapon_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/core/utils/interfaces/i_repository.dart';

class WeaponsRepository implements IRepository {
  @override
  final IHttpClient httpClient;

  const WeaponsRepository(this.httpClient);

  @override
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
