// import 'package:flutter_application_1/application/auth/interfaces/auth_request.dart';
// import 'package:flutter_application_1/application/auth/models/tokens.dart';
// import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';

// class TokensRepository {
//   final IHttpClient httpClient;

//   const TokensRepository(this.httpClient);

//   Future<Tokens> fetch(String url, AuthRequest data) async {
//     final tokensRaw = await httpClient.post(url, data);

//     return Tokens.fromJson(tokensRaw);
//   }
// }
