import 'package:freezed_annotation/freezed_annotation.dart';

enum AttachmentType {
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

void main() {
  final attachment = AttachmentType.audio;

  print("Attachment is $attachment");
  print("Attachment toJson is ${attachment.toJson()}");
  print("Attachment toJson is ${AttachmentType.fromJson('value')}");
}