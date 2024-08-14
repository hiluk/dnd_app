import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'mock_di.config.dart';

GetIt mockDi = GetIt.instance;

@InjectableInit(
  initializerName: 'mockInit',
  generateForDir: ['test'],
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureMockDependencies() async => mockDi.mockInit();
