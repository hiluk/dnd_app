import 'package:flutter_application_1/core/api/armor/models/armor_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/core/utils/interfaces/i_repository.dart';

class ArmorRepository implements IRepository {
  @override
  final IHttpClient httpClient;

  const ArmorRepository(this.httpClient);

  @override
  Future<List<Armor>> fetch() async {
    final data = await httpClient.get('armor');
    final armorRawList = data["results"] as List<dynamic>;

    return armorRawList
        .map(
          (json) => Armor.fromJson(json),
        )
        .toList();
  }
}
