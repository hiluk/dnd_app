import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(as: IHttpClient)
class MockHttpClient extends Mock implements IHttpClient {}
