import 'package:flutter_application_1/application/core/components/backgrounds/models/background_model.dart';
import 'package:flutter_application_1/application/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/application/core/utils/interfaces/i_repository.dart';

class BackgroundsRepository implements IRepository {
  @override
  final IHttpClient httpClient;

  const BackgroundsRepository(this.httpClient);

  @override
  Future<List<Background>> fetch() async {
    final data = await httpClient.get('backgrounds');
    final backgroundRawList = data["results"] as List<dynamic>;

    return backgroundRawList
        .map(
          (json) => Background.fromJson(json),
        )
        .toList();
  }
}
