import 'package:freezed_annotation/freezed_annotation.dart';

part 'njangi_group_circle.freezed.dart';
part 'njangi_group_circle.g.dart';

@freezed
class NjangiGroupCircle with _$NjangiGroupCircle {
  factory NjangiGroupCircle() = _NjangiGroupCircle;

  factory NjangiGroupCircle.fromJson(Map<String, dynamic> json) => _$NjangiGroupCircleFromJson(json);
}
