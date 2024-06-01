import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_account.g.dart';
part 'payment_account.freezed.dart';

@freezed
class PaymentAccount with _$PaymentAccount {
  factory PaymentAccount() = _PaymentAccount;

  factory PaymentAccount.fromJson(Map<String, dynamic> json) => _$PaymentAccountFromJson(json);
}