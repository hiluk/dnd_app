import 'package:flutter_application_1/core/api/feats/models/feat_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/core/utils/interfaces/i_repository.dart';

class FeatsRepository implements IRepository {
  @override
  final IHttpClient httpClient;

  const FeatsRepository(this.httpClient);

  @override
  Future<List<Feat>> fetch() async {
    final data = await httpClient.get('weapons');
    final featsRawList = data["results"] as List<dynamic>;

    return featsRawList
        .map(
          (json) => Feat.fromJson(json),
        )
        .toList();
  }
}
