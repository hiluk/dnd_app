import 'package:dnd_app/core/api/backgrounds/models/background_model.dart';
import 'package:dnd_app/core/catalog/catalog_repository.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Предыстория передаётся по сети кодом и сопоставляется со справочником
class BackgroundConverter implements JsonConverter<Background, int> {
  const BackgroundConverter();

  @override
  Background fromJson(int json) {
    return di.get<CatalogRepository>().backgrounds.firstWhere(
          (e) => e.type == json,
          orElse: () =>
              throw StateError('Предыстория $json не найдена в справочнике'),
        );
  }

  @override
  int toJson(Background object) => object.type;
}
