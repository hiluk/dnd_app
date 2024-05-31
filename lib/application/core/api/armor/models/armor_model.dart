import 'package:freezed_annotation/freezed_annotation.dart';

part 'armor_model.freezed.dart';
part 'armor_model.g.dart';

@freezed
class Armor with _$Armor {
  factory Armor({
    required String name,
    required String slug,
    required String category,
    @JsonKey(name: 'base_ac') required int baseAc,
    @JsonKey(name: 'base_dex_mod') required bool? baseDexMod,
    @JsonKey(name: 'base_con_mod') required bool? baseConMod,
    @JsonKey(name: 'base_wis_mod') required bool? baseWisMod,
    @JsonKey(name: 'base_flat_mod') required bool? baseFlatMod,
    @JsonKey(name: 'plus_max') required int plusMax,
    @JsonKey(name: 'ac_string') required String acString,
    @JsonKey(name: 'strength_requirement') required int? strengthRequirement,
    required String cost,
    required String weight,
    @JsonKey(name: 'stealth_disadvantage') required bool stealtDisadvantage,
  }) = _Armor;

  factory Armor.fromJson(Map<String, dynamic> json) => _$ArmorFromJson(json);
}
