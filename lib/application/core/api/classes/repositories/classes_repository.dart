import 'package:flutter_application_1/application/core/api/classes/models/class_model.dart';
import 'package:flutter_application_1/application/core/http_client/interfaces/i_http_client.dart';
import 'package:flutter_application_1/application/core/utils/interfaces/i_repository.dart';

class ClassesRepository implements IRepository {
  @override
  final IHttpClient httpClient;

  const ClassesRepository(this.httpClient);

  @override
  Future<List<Class>> fetch() async {
    final data = await httpClient.get('/classes');
    final classesRawList = data as List<dynamic>;

    return classesRawList
        .map(
          (json) => Class.fromJson(json),
        )
        .toList();
  }
}
