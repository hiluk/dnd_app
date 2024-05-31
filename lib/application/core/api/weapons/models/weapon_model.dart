import 'package:freezed_annotation/freezed_annotation.dart';

part 'weapon_model.freezed.dart';
part 'weapon_model.g.dart';

@freezed
class Weapon with _$Weapon {
  factory Weapon({
    required String name,
    required String slug,
    required String category,
    required String cost,
    @JsonKey(name: 'damage_dice') required String damageDice,
    @JsonKey(name: 'damage_type') required String damageType,
    required String weight,
    required List<String>? properties,
  }) = _Weapon;

  factory Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);
}
