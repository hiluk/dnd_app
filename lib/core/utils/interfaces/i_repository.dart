import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

abstract interface class IRepository {
  IHttpClient get httpClient;
  Future fetch();
}
