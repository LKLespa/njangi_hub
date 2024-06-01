import 'package:freezed_annotation/freezed_annotation.dart';

part 'njangi_group_settings.freezed.dart';
part 'njangi_group_settings.g.dart';


@freezed
class NjangiGroupSettings with _$NjangiGroupSettings {
  factory NjangiGroupSettings() = _NjangiGroupSettings;

  factory NjangiGroupSettings.fromJson(Map<String, dynamic> json) => _$NjangiGroupSettingsFromJson(json);
}