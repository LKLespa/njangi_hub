import 'package:freezed_annotation/freezed_annotation.dart';

enum AttachmentType {
  text('text'),
  image('image'),
  video('video'),
  audio('audio'),
  document('document');

  final String value;

  const AttachmentType(this.value);

  String toJson() => value;

  static AttachmentType fromJson(String value){
    return AttachmentType.values.firstWhere((e) => e.value == value,
    orElse: () => AttachmentType.document,
  );
  }
}