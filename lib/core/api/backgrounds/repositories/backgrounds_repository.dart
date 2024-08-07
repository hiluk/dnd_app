import 'package:flutter_application_1/core/api/backgrounds/models/background_model.dart';
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

class BackgroundsRepository {
  final IHttpClient httpClient;

  const BackgroundsRepository(this.httpClient);

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
