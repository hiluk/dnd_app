import 'package:dio/dio.dart';
import 'package:flutter_application_1/application/core/http_client/http_client.dart';
import 'package:provider/provider.dart';

final httpClient = Provider(create: (context) => HttpClient(Dio()));
